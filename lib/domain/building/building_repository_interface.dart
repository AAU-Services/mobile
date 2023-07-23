import 'package:aau_service/domain/building/building_failure.dart';
import 'package:aau_service/domain/building/building_form.dart';
import 'package:dartz/dartz.dart';

import 'building.dart';

abstract class BuildingRepositoryInterface {
  Future<Either<BuildingFailure, Building>> createBuilding(
      BuildingForm building);
  Future<Either<BuildingFailure, List<Building>>> getBuildings();
  Future<Either<BuildingFailure, Building>> getBuilding(String id);
  Future<Either<BuildingFailure, Building>> updateBuilding(
      BuildingForm building);
  Future<Either<BuildingFailure, Unit>> deleteBuilding(String id);
}
