class Event {
  final String id;
  final String title;
  final String expiryDate;

  Event({required this.id, required this.title, required this.expiryDate});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['title'],
      expiryDate: json['expiryDate'],
    );
  }
}
