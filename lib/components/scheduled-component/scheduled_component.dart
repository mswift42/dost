import 'package:angular2/angular2.dart' show Component;
import 'package:dost/shared/TaskService.dart' show TaskService;

@Component(
    selector: 'scheduled',
    templateUrl: 'scheduled-component.html',
    styleUrls: const ['scheduled-component.css'],
    inputs: const ['scheduled', 'taskid'])
class ScheduledComponent {
  DateTime scheduled;
  String taskid;
  bool editing;
  final TaskService _taskService;

  ScheduledComponent(this._taskService);

  void editScheduled(String scheduled) {
    List<int> sched = scheduled.split("/").map((i) => int.parse(i));
    _taskService.editScheduled(
        taskid, new DateTime(sched[2], sched[1], sched[0]));
  }
}
