library dost.components.newnote_component;

import 'package:angular2/angular2.dart' show Component;

@Component(
    selector: 'new-note',
templateUrl: 'newnote-component.html',
inputs: const ['taskid']
)
class NewNoteComponent {
  String taskid;
  bool addingNote;

  void toggleAddingNote() {
    addingNote = !addingNote;
  }
}