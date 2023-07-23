import '../../domain/campus/campus.dart';

class CampusDto {
  String? id;
  String name;
  String address;
  String photo;
  String description;
  List<String> buildings; // List of building ids

  CampusDto(
      {this.id,
      required this.name,
      required this.address,
      required this.photo,
      required this.description,
      required this.buildings});

  factory CampusDto.fromJson(Map<String, dynamic> json) {
    return CampusDto(
        id: json["_id"],
        name: json["name"],
        address: json["address"],
        photo: json["photo"],
        description: json["description"],
        buildings: json["buildings"].cast<String>());
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "address": address,
      "photo": photo,
      "description": description,
      "buildings": buildings
    };
  }

  Campus toCampus() {
    return Campus(
        id: id!,
        name: name,
        address: address,
        photo: photo,
        description: description,
        buildings: buildings);
  }
}
