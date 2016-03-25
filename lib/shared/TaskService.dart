library dost.shared.TaskService;

import 'package:angular2/angular2.dart';
import 'package:dost/shared/Task.dart' show Task;
import 'package:intl/intl.dart' show DateFormat;
import 'package:firebase/firebase.dart';

@Injectable()
class TaskService {
  List<Task> tasklist = [
    new Task("summary1", 1),
    new Task("summary2", 2),
    new Task("summary3", 3)
  ];
  Firebase fbRef =
      new Firebase("https://vivid-torch-1460.firebaseio.com/").child("tasks");

  List<Task> getTasks() {
    fbRef.once("value").then((snapshot) => print(snapshot.val()));
    return this.tasklist;
  }

  Task getTask(int id) {
    return tasklist.firstWhere((i) => i.id == id);
  }

  void addTask(Task task) {
    this.tasklist.insert(0, task);
    fbRef.push(value: {"summary": task.summary, "id": task.id});
  }

  void editSummary(String taskid, String newsummary) {
    int id = int.parse(taskid);
    tasklist.firstWhere((i) => i.id == id).summary = newsummary;
  }

  void deleteTask(int taskid) {
    Task task = getTask(taskid);
    tasklist.remove(task);
  }

  void addTaskNote(String taskid, String note) {
    Task task = getTask(int.parse(taskid));
    task.addTaskNote(note);
  }

  void deleteNote(String taskid, String index) {
    int id = int.parse(taskid);
    int idx = int.parse(index);
    tasklist.firstWhere((i) => i.id == id).tasknotes.removeAt(idx);
  }

  void editNote(String taskid, String index, String newnote) {
    int id = int.parse(taskid);
    int noteidx = int.parse(index);
    tasklist.firstWhere((i) => i.id == id).tasknotes[noteidx] = newnote;
  }

  String formatDate(DateTime date) {
    DateFormat format = new DateFormat('dd/MM/yyyy');
    return format.format(date);
  }

  void editScheduled(String taskid, DateTime scheduled) {
    int id = int.parse(taskid);
    tasklist.firstWhere((i) => i.id == id).scheduled = scheduled;
  }
}
