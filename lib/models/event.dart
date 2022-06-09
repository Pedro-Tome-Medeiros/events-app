class Event {
  int day;
  String month;
  int year;
  String hour;
  String location;
  String title;
  String subtitle;

  Event(
      {required this.day,
      required this.month,
      required this.year,
      required this.hour,
      required this.location,
      required this.title,
      required this.subtitle});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      day: json['day'],
      month: json['month'],
      year: json['year'],
      hour: json['hour'],
      location: json['location'],
      title: json['title'],
      subtitle: json['subtitle'],
    );
  }
}
