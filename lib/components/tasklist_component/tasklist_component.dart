library dost.components.tasklist_component;

import 'package:angular2/angular2.dart';
import 'package:dost/shared/Task.dart';
import 'package:dost/shared/TaskService.dart';
import 'package:dost/components/task_component/task_component.dart';

@Component(
    selector: 'tasklist',
    templateUrl: 'tasklist-component.html',
    styleUrls: const ['tasklist-component.css'],
    directives: const [NgFor, TaskComponent],
    providers: const [TaskService])
  class TaskListComponent implements OnInit {
    List<Task> tasks;
    final TaskService _taskService;
    TaskListComponent(this._taskService);

    ngOnInit() {
      tasks = _taskService.getTasks();
    }

    void submitNewTask(String summary) {
      if (summary.length > 0) {
        tasks.insert(0, new Task(summary));
      }
    }
  }
