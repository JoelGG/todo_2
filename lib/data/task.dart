class Task {
  String title;
  DateTime time;

  Task(this.title, this.time);

  Task.fromJson(Map<String, dynamic> json) {
    title = json['title'].toString();
    time = DateTime.parse(json['time']);
  }

  Map toJson() {
    return {
      'title': title.toString(),
      'time': time.toString(),
    };
  }
}