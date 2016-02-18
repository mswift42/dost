library task_service_test;

import 'package:test/test.dart';
import 'package:dost/shared/TaskService.dart';
import 'package:dost/shared/Task.dart';

void main() {
  test('Tasklist gets loaded', () {
    final ts = new TaskService();
    var tl = ts.getTasks();
    expect(tl.length, 3);
  });
  test('Tasklist tasks can be deleted.', () {
    var ts = new TaskService();
    var t1 = new Task("some of many", 1);
    ts.addTask(t1);
    expect(ts.getTasks().length, 4);
    ts.deleteTask(t1);
    expect(ts.getTasks().length, 3);
  });
  test('Tasklist tasks can be edited', () {
    var ts = new TaskService();
    expect(ts.getTasks()[0].summary, "summary1");
    ts.editSummary("1", "summary111");
    expect(ts.getTasks()[0].summary, "summary111");
  });
}
