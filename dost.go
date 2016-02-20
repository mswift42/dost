package dost

import (
	"encoding/json"
	"io"
	"net/http"
	"strconv"
	"time"

	"github.com/gorilla/mux"

	"appengine"
	"appengine/datastore"
)

// Task represents a single Task object, with an ID, a task summary
// the task content, consisting of a slice of strings, a scheduled
// date, the task status `done` (true or false) and a slice
// of taskCategories.
type Task struct {
	ID        int64     `json:"id" datastore:"-"`
	Summary   string    `json:"summary"`
	Content   []string  `json:"content"`
	Scheduled time.Time `json:"scheduled"`
	Done      bool      `json:"done"`
	Category  []string  `json:"category"`
}

func keyForID(c appengine.Context, id int64) *datastore.Key {
	return datastore.NewKey(c, "Task", "", id, tasklistkey(c))
}

func tasklistkey(c appengine.Context) *datastore.Key {
	return datastore.NewKey(c, "Task", "default_tasklist", 0, nil)
}

func (t *Task) key(c appengine.Context) *datastore.Key {
	if t.ID == 0 {
		return datastore.NewIncompleteKey(c, "Task", tasklistkey(c))
	}
	return datastore.NewKey(c, "Task", "", t.ID, tasklistkey(c))
}

func (t *Task) save(c appengine.Context) (*Task, error) {
	k, err := datastore.Put(c, t.key(c), t)
	if err != nil {
		return nil, err
	}
	t.ID = k.IntID()
	return t, nil
}

func decodeTask(r io.ReadCloser) (*Task, error) {
	defer r.Close()
	var task Task
	err := json.NewDecoder(r).Decode(&task)
	return &task, err
}

func listTasks(c appengine.Context) ([]Task, error) {
	tasks := []Task{}
	keys, err := datastore.NewQuery("Task").Ancestor(tasklistkey(c)).Order("Done").Order("Scheduled").GetAll(c, &tasks)
	if err != nil {
		return nil, err
	}
	for i := 0; i < len(tasks); i++ {
		tasks[i].ID = keys[i].IntID()
	}
	return tasks, err
}

func init() {
	r := mux.NewRouter().PathPrefix("/api/").Subrouter()
	r.HandleFunc("/tasks/", getAllTasks).Methods("GET")
	r.HandleFunc("/tasks/", postTask).Methods("POST")
	r.HandleFunc("/tasks/{task}", deleteTask).Methods("DELETE")
	r.HandleFunc("/tasks/", postTask).Methods("PUT")
	http.Handle("/api/", r)
}

func getAllTasks(w http.ResponseWriter, r *http.Request) {
	w.Header().Add("Access-Control-Allow-Origin", "*")
	c := appengine.NewContext(r)
	tasks, err := listTasks(c)
	if err != nil {
		http.Error(w, err.Error(), http.StatusNotFound)
	}
	if err := json.NewEncoder(w).Encode(tasks); err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
	}
}

func postTask(w http.ResponseWriter, r *http.Request) {
	w.Header().Add("Access-Control-Allow-Origin", "*")
	c := appengine.NewContext(r)
	task := Task{}
	if err := json.NewDecoder(r.Body).Decode(&task); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
	}
	// sched, err := time.Parse("02/01/2006", task.Scheduled)
	// if err != nil {
	// 	http.Error(w, err.Error(), http.StatusBadRequest)
	// }
	// task.Scheduled = sched
	ntask, err := task.save(c)
	if err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
	}
	if err := json.NewEncoder(w).Encode(ntask); err != nil {
		http.Error(w, err.Error(), http.StatusNotFound)
	}

}

func deleteTask(w http.ResponseWriter, r *http.Request) {
	w.Header().Add("Access-Control-Allow-Origin", "*")
	c := appengine.NewContext(r)
	id := mux.Vars(r)["task"]
	intid, err := strconv.ParseInt(id, 10, 64)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
	}
	key := keyForID(c, intid)
	if err := datastore.Delete(c, key); err != nil {
		http.Error(w, err.Error(), http.StatusNotFound)
	}

}
