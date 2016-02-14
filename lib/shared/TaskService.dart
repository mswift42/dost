library dost.shared.TaskService;

import 'package:angular2/angular2.dart' show Injectable;
import 'package:dost/shared/Task.dart';

@Injectable()
class TaskService {
  List<Task> tasklist = [
  new Task("summary1"),
  new Task("summary2"),
  new Task("summary3")];

  List<Task> getTasks() {
    return this.tasklist;
  }

  void addTask(Task task) {
    this.tasklist.insert(0, task);
  }

  void deleteTask(Task task) {
    tasklist.remove(task);
  }
}