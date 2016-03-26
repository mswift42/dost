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
    fbRef.once("value").then((snapshot) => snapshot.forEach((i) =>
        tasklist.insert(0, new Task(snapshot.val()[i.key]["summary"], i.key))));
    return tasklist;
  }

  Task getTask(String id) {
    return tasklist.firstWhere((i) => i.id == id);
  }

  void addTask(String summary) {
    var newtaskref = fbRef.push();
    newtaskref.set({"summary": summary});
    tasklist.insert(0, new Task(summary, newtaskref.key));
  }

  void editSummary(String taskid, String newsummary) {
    tasklist.firstWhere((i) => i.id == taskid).summary = newsummary;
  }

  void deleteTask(String taskid) {
    Task task = getTask(taskid);
    tasklist.remove(task);
    fbRef.child(taskid).remove();
  }

  void addTaskNote(String taskid, String note) {
    Task task = getTask(taskid);
    task.addTaskNote(note);
  }

  void deleteNote(String taskid, String index) {
    int idx = int.parse(index);
    tasklist.firstWhere((i) => i.id == taskid).tasknotes.removeAt(idx);
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
    tasklist.firstWhere((i) => i.id == taskid).scheduled = scheduled;
  }
}
