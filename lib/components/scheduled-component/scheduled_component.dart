import 'package:angular2/angular2.dart' show Component;

@Component(
    selector: 'scheduled',
    templateUrl: 'scheduled-component.html',
    styleUrls: const ['scheduled-component.css'],
    inputs: const ['scheduled', 'taskid'])
class ScheduledComponent {
  DateTime scheduled;
  String taskid;
}
