library Task;

class Task {
  String summary;
  List<String> tasknotes = [];
  DateTime scheduled;
  int id;
  Set<TaskCategory> categories = new Set<TaskCategory>();
  Task(this.summary, this.id);

  void addCategory(TaskCategory cat) {
    categories.add(cat);
  }

  void addTaskNote(String note) {
    tasknotes.insert(0, note);
  }
}

class TaskCategory {
  String category;
  TaskCategory(this.category);
}

class TaskCategories {
  static final Set<TaskCategory> categories = new Set<TaskCategory>.from([
    new TaskCategory("Work"),
    new TaskCategory("Travel"),
    new TaskCategory("Personal"),
    new TaskCategory("Fitness"),
    new TaskCategory("Friends"),
    new TaskCategory("Family"),
    new TaskCategory("Purchases")
  ]);
}
