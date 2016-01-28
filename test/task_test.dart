library task_test;

import 'package:test/test.dart';
import 'package:dost/shared/Task.dart';

void main() {
  test('Task gets initialised correctly', () {
    var t1 = new Task('summary1');
    expect(t1.summary, 'summary1');
  });
}