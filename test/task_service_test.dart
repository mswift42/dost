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
    ts.deleteTask(t1.id);
    expect(ts.getTasks().length, 3);
  });
  test('task summaries can be edited', () {
    var ts = new TaskService();
    expect(ts.getTasks()[0].summary, "summary1");
    ts.editSummary("1", "summary111");
    expect(ts.getTasks()[0].summary, "summary111");
  });
  test('Task notes can be added', () {
    var ts = new TaskService();
    var t1 = ts.getTasks()[0];
    expect(t1.tasknotes.length, 0);
    ts.addTaskNote("1", "note1");
    expect(ts.getTasks()[0].tasknotes.length, 1);
  });
  test('Task notes can be deleted', () {
    var ts = new TaskService();
    ts.addTaskNote("1", "note1");
    expect(ts.getTasks()[0].tasknotes.length, 1);
    ts.deleteNote("1", "0");
    expect(ts.getTasks()[0].tasknotes.length, 0);
  });
  test('Task notes can be edited', () {
    var ts = new TaskService();
    ts.addTaskNote("2", "note1");
    ts.addTaskNote("2", "note2");
    expect(ts.getTasks()[1].tasknotes.length, 2);
    ts.editNote("2", "0", "new note");
    expect(ts.getTasks()[1].tasknotes[0], "new note");
    expect(ts.getTasks()[1].tasknotes[1], "note1");
  });
  test('formatDate formats dates in format dd/MM/yyyy', () {
    var ts = new TaskService();
    var d1 = DateTime.parse("2016-03-01");
    var df1 = ts.formatDate(d1);
    expect(df1, "01/03/2016");
    var d2 = DateTime.parse("2015-12-24");
    expect(ts.formatDate(d2), "24/12/2015");
  });
}
