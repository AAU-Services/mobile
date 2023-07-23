class Building {
  String id;
  String name;
  String address;
  String campus;
  String photo;
  String description;

  Building(
      {required this.id,
      required this.name,
      required this.address,
      required this.campus,
      required this.photo,
      required this.description});

  factory Building.fromJson(Map<String, dynamic> json) {
    return Building(
        id: json["_id"],
        name: json["name"],
        address: json["address"],
        campus: json["campus"],
        photo: json["photo"],
        description: json["description"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name": name,
      "address": address,
      "campus": campus,
      "photo": photo,
      "description": description
    };
  }
}
