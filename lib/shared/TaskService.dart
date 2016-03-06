library dost.shared.TaskService;

import 'package:angular2/angular2.dart';
import 'package:dost/shared/Task.dart';

@Injectable()
class TaskService {
  List<Task> tasklist = [
    new Task("summary1", 1),
    new Task("summary2", 2),
    new Task("summary3", 3)
  ];

  List<Task> getTasks() {
    return this.tasklist;
  }

  Task getTask(int id) {
    return tasklist.firstWhere((i) => i.id == id);
  }

  void addTask(Task task) {
    this.tasklist.insert(0, task);
  }

  void editSummary(String taskid, String newsummary) {
    int id = int.parse(taskid);
    tasklist.firstWhere((i) => i.id == id).summary = newsummary;
  }

  void deleteTask(String taskid) {
    Task task = getTask(int.parse(taskid));
    tasklist.remove(task);
  }

  void addTaskNote(String taskid, String note) {
    Task task = getTask(int.parse(taskid));
    task.addTaskNote(note);
  }

  void editNote(String taskid, String index, String newnote) {
    int id = int.parse(taskid);
    int noteidx = int.parse(index);
    tasklist.firstWhere((i) => i.id == id).tasknotes[noteidx] = newnote;
  }
}
