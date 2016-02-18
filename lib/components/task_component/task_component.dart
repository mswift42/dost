library dost.components.task_component;

import 'package:angular2/angular2.dart';
import 'package:dost/shared/Task.dart' show Task;
import 'package:dost/shared/TaskService.dart' show TaskService;

@Component(
    selector: 'task',
    templateUrl: 'task-component.html',
    styleUrls: const ['task-component.css'],
    inputs: const ['summary', 'taskid'])
class TaskComponent {
  String summary;
  String taskid;
  bool editing = false;
  TaskService _taskService;
  TaskComponent(this._taskService);

  void toggleEdit() {
    editing = !editing;
  }

  void editSummary(String summary) {
    _taskService.editSummary(taskid, summary);
    toggleEdit();
  }
}
