import 'package:angular2/angular2.dart' show Component;
import 'package:dost/shared/TaskService.dart' show TaskService;

@Component(
    selector: 'scheduled',
    templateUrl: 'scheduled-component.html',
    styleUrls: const ['scheduled-component.css'],
    inputs: const ['scheduled', 'taskid'])
class ScheduledComponent {
  String scheduled;
  String taskid;
  bool editing = false;
  bool dateinvalid = false;
  final TaskService _taskService;

  ScheduledComponent(this._taskService);

  void toggleEditing() {
    editing = !editing;
  }

  bool validDateString(String date) {
    try {
      DateTime.parse(date);
    } catch (exception, stacktrace) {
      return false;
    }
    return true;
  }

  void editScheduled(event) {
    String dateval = event.target.value;
    if (!validDateString(dateval)) {
      dateinvalid = true;
    } else {
      _taskService.editScheduled(taskid, DateTime.parse(dateval));
      dateinvalid = false;
      editing = !editing;
    }
  }
}
