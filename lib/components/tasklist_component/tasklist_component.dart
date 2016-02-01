library dost.components.tasklist_component;

import 'package:angular2/angular2.dart';
import 'package:dost/shared/Task.dart';
import 'package:dost/shared/TaskService.dart';

@Component(selector: 'tasklist',
    templateUrl: 'tasklist-component.html',
    providers: const [TaskService])

class TaskListComponent {}
