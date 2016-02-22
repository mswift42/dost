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
    tasklist.firstWhere((i) => i.id == id);
  }

  void addTask(Task task) {
    this.tasklist.insert(0, task);
  }

  void editSummary(String taskid, String newsummary) {
    int id = int.parse(taskid);
    tasklist.firstWhere((i) => i.id == id).summary = newsummary;
  }

  void deleteTask(String taskid) {
    Task task = tasklist.firstWhere((i) => i.id == id);
    tasklist.remove(task);
  }
}
