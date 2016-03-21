import 'package:angular2/angular2.dart' show Component, OnInit, Input;
import 'package:dost/shared/TaskService.dart' show TaskService;
import 'package:intl/intl.dart' show DateFormat;

@Component(
    selector: 'scheduled',
    templateUrl: 'scheduled-component.html',
    styleUrls: const ['scheduled-component.css'])
class ScheduledComponent {
  @Input() DateTime scheduled;
  @Input() String taskid;
  bool editing = false;
  bool dateinvalid = false;
  final TaskService _taskService;

  ScheduledComponent(this._taskService) {
  }

  void toggleEditing() {
    editing = !editing;
  }
  DateTime parseDate(String datestring) {
    return DateTime.parse(datestring);
  }

  bool validDateString(String date) {
    try {
      DateTime.parse(date);
    } catch (exception, _) {
      return false;
    }
    return true;
  }

  void editScheduled(event) {
    String dateval = event.target.value;
    if (!validDateString(dateval)) {
      dateinvalid = true;
    } else {
      _taskService.editScheduled(
          taskid, DateTime.parse(dateval).toIso8601String());
      dateinvalid = false;
      toggleEditing();
    }
  }
}
