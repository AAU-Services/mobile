class EventDto {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final String address;
  final String? photo;
  final DateTime createdAt;
  final DateTime updatedAt;

  EventDto({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.address,
    this.photo,
    required this.createdAt,
    required this.updatedAt,
  });

  factory EventDto.fromJson(Map<String, dynamic> json) {
    return EventDto(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: DateTime.parse(json['date']),
      address: json['address'],
      photo: json['photo'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'address': address,
      'date': date,
      'photo': photo,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
