library dost.components.task_component;

import 'package:angular2/angular2.dart';

@Component(selector: 'task', templateUrl: 'task-component.html',
    inputs: const ['summary'])

class TaskComponent {
  String summary;
}
