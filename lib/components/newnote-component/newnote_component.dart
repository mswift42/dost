library dost.components.newnote_component;

import 'package:angular2/angular2.dart' show Component;
import 'package:dost/shared/TaskService.dart' show TaskService;

@Component(
    selector: 'new-note',
    templateUrl: 'newnote-component.html',
    inputs: const ['taskid'])
class NewNoteComponent {
  String taskid;
  bool addingNote;
  final TaskService _taskService;

  NewNoteComponent(this._taskService);

  void toggleAddingNote() {
    addingNote = !addingNote;
  }

  void addNote(event) {
    _taskService.addTaskNote(taskid, event.target.value);
    toggleAddingNote();
  }
}
