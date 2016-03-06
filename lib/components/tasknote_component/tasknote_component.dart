library dost.components.tasknote_component;

import 'package:angular2/angular2.dart';
import 'package:dost/shared/TaskService.dart' show TaskService;

@Component(
    selector: 'task-note',
    templateUrl: 'tasknote-component.html',
    inputs: const ['tasknote', 'taskid', 'index'])
class TaskNoteComponent {
  String tasknote;
  String taskid;
  String index;
  bool editing = false;
 final TaskService _taskService;

  TaskNoteComponent(this._taskService);


  void toggleEditing() {
    editing = !editing;
  }
  void editNote(String note) {
    _taskService.editNote(taskid, index, tasknote);
  }
}
