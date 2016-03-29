library dost.shared.TaskService;

import 'package:angular2/angular2.dart';
import 'package:dost/shared/Task.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:firebase/firebase.dart';

@Injectable()
class TaskService {
  List<Task> tasklist = [];
  Firebase fbRef = new Firebase("https://vivid-torch-1460.firebaseio.com/");

  List<Task> getTasks() {
    fbRef.once("value").then((snapshot) => snapshot.forEach((i) {
          String id = i.key;
          Map taskval = snapshot.val()[id];
          Task task = new Task(taskval["summary"], id)
            ..tasknotes = taskval["tasknotes"] ?? []
            ..scheduled = (taskval["scheduled"] != null)
                ? DateTime.parse(taskval["scheduled"]).toLocal()
                : null;
          tasklist.insert(0, task);
        }));
    return tasklist;
  }

  Task getTask(String id) {
    return tasklist.firstWhere((i) => i.id == id);
  }

  void addTask(String summary) {
    var newtaskref = fbRef.push();
    newtaskref.set({"summary": summary, "scheduled": null, "tasknotes": null});
    tasklist.insert(0, new Task(summary, newtaskref.key));
  }

  void editSummary(String taskid, String newsummary) {
    tasklist.firstWhere((i) => i.id == taskid).summary = newsummary;
    fbRef.child(taskid).update({"summary": newsummary});
  }

  void deleteTask(String taskid) {
    Task task = getTask(taskid);
    tasklist.remove(task);
    fbRef.child(taskid).remove();
  }

  void addTaskNote(String taskid, String note) {
    Task task = getTask(taskid);
    task.addTaskNote(note);
    fbRef.child(taskid).update({"tasknotes": task.tasknotes});
  }

  void deleteNote(String taskid, String index) {
    int idx = int.parse(index);
    tasklist.firstWhere((i) => i.id == taskid).tasknotes.removeAt(idx);
    fbRef.child(taskid).update({"tasknotes": getTask(taskid).tasknotes});
  }

  void editNote(String taskid, String index, String newnote) {
    int noteidx = int.parse(index);
    tasklist.firstWhere((i) => i.id == taskid).tasknotes[noteidx] = newnote;
    fbRef.child(taskid).update({"tasknotes": getTask(taskid).tasknotes});
  }

  String formatDate(DateTime date) {
    DateFormat format = new DateFormat('dd/MM/yyyy');
    return format.format(date);
  }

  void editScheduled(String taskid, DateTime scheduled) {
    tasklist.firstWhere((i) => i.id == taskid).scheduled = scheduled;
    fbRef.child(taskid).update({"scheduled": getTask(taskid).scheduled});
  }

  bool dueToday(String taskid) {
    DateTime today = new DateTime.now();
    DateTime taskdue = getTask(taskid).scheduled;
    if (taskdue == null) {
      return false;
    }
    DateFormat formatter = new DateFormat("yyyy-MM-dd");
    return formatter.format(today) == formatter.format(taskdue);
  }
}
