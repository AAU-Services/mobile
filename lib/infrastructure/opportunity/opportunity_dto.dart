class OpportunityDto {
  final String id;
  final String title;
  final String description;
  final DateTime? deadline;
  final String? photo;
  final DateTime createdAt;
  final DateTime updatedAt;

  OpportunityDto({
    required this.id,
    required this.title,
    required this.description,
    this.deadline,
    this.photo,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OpportunityDto.fromJson(Map<String, dynamic> json) {
    return OpportunityDto(
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'deadline': deadline,
      'photo': photo,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
