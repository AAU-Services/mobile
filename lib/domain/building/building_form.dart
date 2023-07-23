import 'package:aau_service/infrastructure/building/buliding_dto.dart';

class BuildingForm {
  String name;
  String address;
  String campus;
  String photo;
  String description;

  BuildingForm(
      {required this.name,
      required this.address,
      required this.campus,
      required this.photo,
      required this.description});

  BuildingDto toDto() {
    return BuildingDto(
        name: name,
        address: address,
        campus: campus,
        photo: photo,
        description: description);
  }
}
