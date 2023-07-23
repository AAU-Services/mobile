import 'dart:convert';
import 'package:aau_service/infrastructure/building/buliding_dto.dart';
import 'package:aau_service/util/custom_http_client.dart';
import 'package:dartz/dartz.dart';

class BuildingProvider {
  final CustomHttpClient _customHttpClient;
  BuildingProvider(this._customHttpClient);

  Future<BuildingDto> createBuilding(BuildingDto building) async {
    final response = await _customHttpClient.post(
        "/building", json.encode(building.toJson()));

    if (response.statusCode == 201) {
      return BuildingDto.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to create building");
    }
  }

  Future<BuildingDto> getBuilding(String id) async {
    final response = await _customHttpClient.get("/building/$id");

    if (response.statusCode == 200) {
      return BuildingDto.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to get building");
    }
  }

  Future<List<BuildingDto>> getBuildings() async {
    final response = await _customHttpClient.get("/building");

    if (response.statusCode == 200) {
      final List<dynamic> buildings = json.decode(response.body);
      return buildings.map((e) => BuildingDto.fromJson(e)).toList();
    } else {
      throw Exception("Failed to get buildings");
    }
  }

  Future<BuildingDto> updateBuilding(BuildingDto building) async {
    final response = await _customHttpClient.put(
        "/building/${building.id}", json.encode(building.toJson()));

    if (response.statusCode == 200) {
      return BuildingDto.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to update building");
    }
  }

  Future<Unit> deleteBuilding(String id) async {
    final response = await _customHttpClient.delete("/building/$id");

    if (response.statusCode == 200) {
      return unit;
    } else {
      throw Exception("Failed to delete building");
    }
  }
}
