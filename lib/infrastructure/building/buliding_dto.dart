import 'package:aau_service/domain/building/building.dart';

class BuildingDto {
  String? id = "";
  String name;
  String address;
  String campus;
  String photo;
  String description;

  BuildingDto({
    required this.name,
    required this.address,
    required this.campus,
    required this.photo,
    required this.description,
    this.id = "",
  });

  factory BuildingDto.fromJson(Map<String, dynamic> json) {
    return BuildingDto(
        id: json["_id"],
        name: json["name"],
        address: json["address"],
        campus: json["campus"],
        photo: json["photo"],
        description: json["description"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "address": address,
      "campus": campus,
      "photo": photo,
      "description": description
    };
  }

  Building toBuilding() {
    return Building(
        id: id!,
        name: name,
        address: address,
        campus: campus,
        photo: photo,
        description: description);
  }
}
