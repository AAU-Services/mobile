class Opportunity {
  final String id;
  final String title;
  final String description;
  final DateTime? deadline;
  final String? photo;
  final DateTime createdAt;
  final DateTime updatedAt;

  Opportunity({
    required this.id,
    required this.title,
    required this.description,
    this.deadline,
    this.photo,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Opportunity.fromJson(Map<String, dynamic> json) {
    return Opportunity(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      deadline:
          json['deadline'] != null ? DateTime.parse(json['deadline']) : null,
      photo: json['photo'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
