class Campus {
  String id;
  String name;
  String address;
  String photo;
  String description;
  List<String> buildings; //TODO: Change to List<Building>

  Campus(
      {required this.id,
      required this.name,
      required this.address,
      required this.photo,
      required this.description,
      required this.buildings});

  factory Campus.fromJson(Map<String, dynamic> json) {
    return Campus(
        id: json["_id"],
        name: json["name"],
        address: json["address"],
        photo: json["photo"],
        description: json["description"],
        buildings: json["buildings"].cast<String>());
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name": name,
      "address": address,
      "photo": photo,
      "description": description,
      "buildings": buildings
    };
  }
}
