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
