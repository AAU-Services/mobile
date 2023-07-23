import 'package:aau_service/domain/campus/campus_failure.dart';
import 'package:aau_service/domain/campus/campus.dart';
import 'package:aau_service/domain/campus/campus_repository_interface.dart';
import 'package:aau_service/infrastructure/campus/campus_dto.dart';
import 'package:aau_service/infrastructure/campus/campus_provider.dart';
import 'package:dartz/dartz.dart';

class CampusRepository implements CampusRepositoryInterface {
  final CampusProvider _campusProvider;

  CampusRepository(this._campusProvider);

  @override
  Future<Either<CampusFailure, Campus>> createCampus(CampusDto campus) async {
    try {
      final CampusDto campusDto = await _campusProvider.createCampus(campus);
      return right(campusDto.toCampus());
    } catch (err) {
      return left(CampusFailure.serverError());
    }
  }

  @override
  Future<Either<CampusFailure, Unit>> deleteCampus(String id) async {
    try {
      await _campusProvider.deleteCampus(id);
      return right(unit);
    } catch (err) {
      return left(CampusFailure.serverError());
    }
  }

  @override
  Future<Either<CampusFailure, Campus>> getCampus(String id) async {
    try {
      final CampusDto campusDto = await _campusProvider.getCampus(id);
      return right(campusDto.toCampus());
    } catch (err) {
      return left(CampusFailure.serverError());
    }
  }

  @override
  Future<Either<CampusFailure, List<Campus>>> getCampuses() async {
    try {
      final List<CampusDto> campusDtos = await _campusProvider.getCampuses();
      final List<Campus> campuses =
          campusDtos.map((campusDto) => campusDto.toCampus()).toList();
      return right(campuses);
    } catch (err) {
      return left(CampusFailure.serverError());
    }
  }

  @override
  Future<Either<CampusFailure, Campus>> updateCampus(CampusDto campus) async {
    try {
      final CampusDto campusDto = await _campusProvider.updateCampus(campus);
      return right(campusDto.toCampus());
    } catch (err) {
      return left(CampusFailure.serverError());
    }
  }
}
