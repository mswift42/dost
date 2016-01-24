library Task;



class Task {
  String summary;
  List<String> tasknotes;
  DateTime scheduled;
  TaskCatergory category;

}

class TaskCatergory {
static final Set<String> categories = new Set<String>.from(["work", "travel", "family", "private","purchases"]);
}
