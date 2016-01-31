library dost.shared.TaskService;

import 'package:angular2/angular2.dart' show Injectable;
import 'package:dost/shared/Task.dart';

@Injectable()
class TaskService {
  List<Task> tasklist;

  void addTask(Task task) {
    tasklist.insert(0, task);
  }

  void deleteTask(Task task) {
    tasklist.remove(task);
  }
}