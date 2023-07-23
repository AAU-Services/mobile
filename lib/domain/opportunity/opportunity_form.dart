class OpportunityForm {
  final String title;
  final String description;
  final DateTime? deadline;
  final String? photo;

  OpportunityForm({
    required this.title,
    required this.description,
    required this.deadline,
    this.photo,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'deadline': deadline,
      'photo': photo
    };
  }
}
