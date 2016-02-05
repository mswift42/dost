library dost.components.newtask_component;

import 'package:angular2/angular2.dart';
import 'package:dost/shared/TaskService.dart';
import 'package:dost/shared/Task.dart';

@Component(selector: 'newtask',
    templateUrl: 'newtask-component.html',
    providers: const [TaskService])

class NewTaskComponent {
  TaskService ts;
  NewTaskComponent(TaskService ts) {
    ts = ts;
  }
  void submitNewTask(String summary) {
    if (summary.length > 0) {
      ts.addTask(new Task(summary));
    }
  }

}