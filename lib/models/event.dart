class Event {
  int day;
  String month;
  int year;
  String title;
  String subtitle;

  Event(
      {required this.day,
      required this.month,
      required this.year,
      required this.title,
      required this.subtitle});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      day: json['day'],
      month: json['month'],
      year: json['year'],
      title: json['title'],
      subtitle: json['subtitle'],
    );
  }
}
