library dost.components.tasklist_component;

import 'package:angular2/angular2.dart';
import 'package:dost/shared/Task.dart';
import 'package:dost/shared/TaskService.dart';
import 'package:dost/components/tasknote_component/tasknote_component.dart';
import 'package:dost/components/summary-component/summary_component.dart'
    show SummaryComponent;
import 'package:dost/components/newnote-component/newnote_component.dart'
    show NewNoteComponent;
import 'package:dost/components/scheduled-component/scheduled_component.dart'
    show ScheduledComponent;

@Component(
    selector: 'tasklist',
    templateUrl: 'tasklist-component.html',
    styleUrls: const [
      'tasklist-component.css'
    ],
    directives: const [
      NgFor,
      TaskNoteComponent,
      SummaryComponent,
      NewNoteComponent,
      ScheduledComponent
    ],
    providers: const [
      TaskService
    ])
class TaskListComponent implements OnInit {
  List<Task> tasks;
  final TaskService _taskService;
  TaskListComponent(this._taskService);

  ngOnInit() {
    tasks = _taskService.getTasks();
  }

  void submitNewTask(String summary) {
    if (summary.length > 0) {
      _taskService.addTask(summary);
    }
  }

  void deleteTask(String id) {
    _taskService.deleteTask(id);
  }
  bool isDueToday(String taskid) {
    return _taskService.dueToday(taskid);
  }
}
