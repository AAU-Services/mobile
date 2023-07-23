import 'package:aau_service/infrastructure/campus/campus_dto.dart';
import 'package:dartz/dartz.dart';
import 'campus.dart';
import 'campus_failure.dart';

abstract class CampusRepositoryInterface {
  Future<Either<CampusFailure, Campus>> createCampus(CampusDto campus);
  Future<Either<CampusFailure, List<Campus>>> getCampuses();
  Future<Either<CampusFailure, Campus>> getCampus(String id);
  Future<Either<CampusFailure, Campus>> updateCampus(CampusDto campus);
  Future<Either<CampusFailure, Unit>> deleteCampus(String id);
}
