library dost.components.newtask_component;

import 'package:angular2/angular2.dart';

@Component(selector: 'newtask',
    templateUrl: 'newtask-component.html')

class NewTaskComponent {
  void submitNewTask(String summary) {
    if (summary.length > 0) {
      print(summary);
    }
  }
}