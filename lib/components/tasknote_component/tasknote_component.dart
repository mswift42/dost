library dost.components.tasknote_component;

import 'package:angular2/angular2.dart';
import 'package:dost/shared/TaskService.dart' show TaskService;

@Component(
    selector: 'task-note',
    templateUrl: 'tasknote-component.html',
    styleUrls: const ['tasknote-component.css'],
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
    if (note?.length > 0) {
      _taskService.editNote(taskid, index, tasknote);
    } else {
      toggleEditing();
    }
  }
  void deleteNote() {
    _taskService.deleteNote(taskid, index);
  }
}
