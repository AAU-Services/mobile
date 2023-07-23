import 'package:aau_service/domain/building/building_failure.dart';
import 'package:aau_service/domain/building/building.dart';
import 'package:aau_service/domain/building/building_repository_interface.dart';
import 'package:aau_service/infrastructure/building/building_provider.dart';
import 'package:aau_service/infrastructure/building/buliding_dto.dart';
import 'package:dartz/dartz.dart';

import '../../domain/building/building_form.dart';

class BuildingRepository implements BuildingRepositoryInterface {
  final BuildingProvider _buildingProvider;

  BuildingRepository(this._buildingProvider);

  @override
  Future<Either<BuildingFailure, Building>> createBuilding(
      BuildingForm building) async {
    try {
      final BuildingDto buildingDto =
          await _buildingProvider.createBuilding(building.toDto());
      return right(buildingDto.toBuilding());
    } catch (err) {
      return left(BuildingFailure.serverError());
    }
  }

  @override
  Future<Either<BuildingFailure, Unit>> deleteBuilding(String id) async {
    try {
      final Unit response = await _buildingProvider.deleteBuilding(id);
      return right(response);
    } catch (err) {
      return left(BuildingFailure.serverError());
    }
  }

  @override
  Future<Either<BuildingFailure, Building>> getBuilding(String id) async {
    try {
      final BuildingDto buildingDto = await _buildingProvider.getBuilding(id);
      return right(buildingDto.toBuilding());
    } catch (err) {
      return left(BuildingFailure.serverError());
    }
  }

  @override
  Future<Either<BuildingFailure, List<Building>>> getBuildings() async {
    try {
      final List<BuildingDto> buildingsDto =
          await _buildingProvider.getBuildings();
      final List<Building> buildings =
          buildingsDto.map((e) => e.toBuilding()).toList();
      return right(buildings);
    } catch (err) {
      return left(BuildingFailure.serverError());
    }
  }

  @override
  Future<Either<BuildingFailure, Building>> updateBuilding(
      BuildingForm building) async {
    try {
      final BuildingDto buildingDto =
          await _buildingProvider.updateBuilding(building.toDto());
      return right(buildingDto.toBuilding());
    } catch (err) {
      return left(BuildingFailure.serverError());
    }
  }
}
