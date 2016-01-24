library Task;

class Task {
  String summary;
  List<String> tasknotes;
  DateTime scheduled;
  int id;
  Set<String> category = new Set<String>.from([
    "Work",
    "Travel",
    "Personal",
    "Fitness",
    "Friends",
    "Family",
    "Purchases"
  ]);
}

class TaskCategory {
  String category;
}

class TaskCategories {
  final Set<TaskCategory> categories = new Set<TaskCategory>.from([
    "Work",
    "Travel",
    "Personal",
    "Fitness",
    "Friends",
    "Family",
    "Purchases"
  ]);
  void addCategory(TaskCategory cat) {
    categories.add(cat);
  }
}