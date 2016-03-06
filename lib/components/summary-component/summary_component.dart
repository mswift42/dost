library dost.components.summary_component;

import 'package:angular2/angular2.dart';

@Component(
    selector: 'task-summary',
    templateUrl: 'summary-component.html',
    styleUrls: const ['summary-component.css'],
    inputs: const ['summary'])
class SummaryComponent {
  String summary;
  bool editing = false;

  void toggleEditing() {
    editing = !editing;
  }
}
