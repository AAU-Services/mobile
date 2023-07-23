import 'dart:convert';

import 'package:aau_service/infrastructure/campus/campus_dto.dart';
import 'package:dartz/dartz.dart';

import '../../util/custom_http_client.dart';

class CampusProvider {
  final CustomHttpClient _customHttpClient;
  CampusProvider(this._customHttpClient);

  Future<CampusDto> createCampus(CampusDto campus) async {
    final response =
        await _customHttpClient.post("/campus", json.encode(campus.toJson()));

    if (response.statusCode == 201) {
      return CampusDto.fromJson(json.decode(response.body));
    } else {
      throw Error();
    }
  }

  Future<List<CampusDto>> getCampuses() async {
    final response = await _customHttpClient.get("/campus");

    if (response.statusCode == 200) {
      final campuses = json.decode(response.body) as List;
      return campuses.map((campus) => CampusDto.fromJson(campus)).toList();
    } else {
      throw Error();
    }
  }

  Future<CampusDto> getCampus(String id) async {
    final response = await _customHttpClient.get("/campus/$id");

    if (response.statusCode == 200) {
      return CampusDto.fromJson(json.decode(response.body));
    } else {
      throw Error();
    }
  }

  Future<CampusDto> updateCampus(CampusDto campus) async {
    final response = await _customHttpClient.put(
        "/campus/${campus.id}", json.encode(campus.toJson()));

    if (response.statusCode == 200) {
      return CampusDto.fromJson(json.decode(response.body));
    } else {
      throw Error();
    }
  }

  Future<Unit> deleteCampus(String id) async {
    final response = await _customHttpClient.delete("/campus/$id");

    if (response.statusCode != 200) {
      throw Error();
    } else {
      return unit;
    }
  }
}
