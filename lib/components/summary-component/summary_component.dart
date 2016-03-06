library dost.components.summary_component;

import 'package:angular2/angular2.dart';

@Component(
    selector: 'task-summary',
    templateUrl: 'summary-somponent.html',
    styleUrls: const ['summary-component.css'],
    inputs: const ['summary'])
class SummaryComponent {
  String summary;
}
