class EventForm {
  final String title;
  final String description;
  final String address;
  final DateTime date;
  final String? photo;

  EventForm({
    required this.title,
    required this.description,
    required this.address,
    required this.date,
    this.photo,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'address': address,
      'date': date,
      'photo': photo
    };
  }
}
