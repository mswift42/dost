library dost.components.summary_component;

import 'package:angular2/angular2.dart';
import 'package:dost/shared/TaskService.dart';

@Component(
    selector: 'task-summary',
    templateUrl: 'summary-component.html',
    styleUrls: const ['summary-component.css'],
    inputs: const ['summary', 'taskid'])
class SummaryComponent {
  String summary;
  bool editing = false;
  String taskid;
  final TaskService _taskService;

  SummaryComponent(this._taskService);

  void toggleEditing() {
    editing = !editing;
  }
}
