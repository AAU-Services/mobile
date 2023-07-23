import 'package:aau_service/domain/opportunity/opportunity.dart';
import 'package:aau_service/domain/opportunity/opportunity_failure.dart';
import 'package:aau_service/domain/opportunity/opportunity_form.dart';
import 'package:aau_service/domain/opportunity/opportunity_repository_interface.dart';
import 'package:aau_service/infrastructure/opportunity/opportunity_dto.dart';
import 'package:aau_service/infrastructure/opportunity/opportunity_provider.dart';
import 'package:dartz/dartz.dart';

class OpportunityRepository implements OpportunityRepositoryInterface {
  final OpportunityProvider _opportunityProvider;

  OpportunityRepository(this._opportunityProvider);

  @override
  Future<Either<OpportunityFailure, List<Opportunity>>>
      getOpportunities() async {
    try {
      final List<OpportunityDto> opportunitys =
          await _opportunityProvider.getOpportunities();
      return right(
          opportunitys.map((e) => Opportunity.fromJson(e.toJson())).toList());
    } catch (e) {
      return left(OpportunityFailure.serverError());
    }
  }

  @override
  Future<Either<OpportunityFailure, Opportunity>> getOpportunityById(
      String opportunityId) async {
    try {
      final OpportunityDto opportunity =
          await _opportunityProvider.getOpportunity(opportunityId);
      return right(Opportunity.fromJson(opportunity.toJson()));
    } catch (e) {
      return left(OpportunityFailure.serverError());
    }
  }

  @override
  Future<Either<OpportunityFailure, Opportunity>> createOpportunity(
      OpportunityForm opportunity) async {
    try {
      final OpportunityDto opportunityDto = await _opportunityProvider
          .createOpportunity(OpportunityDto.fromJson(opportunity.toJson()));
      return right(Opportunity.fromJson(opportunityDto.toJson()));
    } catch (e) {
      return left(OpportunityFailure.serverError());
    }
  }

  @override
  Future<Either<OpportunityFailure, Opportunity>> updateOpportunity(
      OpportunityForm opportunity) async {
    try {
      final OpportunityDto opportunityDto = await _opportunityProvider
          .updateOpportunity(OpportunityDto.fromJson(opportunity.toJson()));
      return right(Opportunity.fromJson(opportunityDto.toJson()));
    } catch (e) {
      return left(OpportunityFailure.serverError());
    }
  }

  @override
  Future<Either<OpportunityFailure, Unit>> deleteOpportunity(
      String opportunityId) async {
    try {
      await _opportunityProvider.deleteOpportunity(opportunityId);
      return right(unit);
    } catch (e) {
      return left(OpportunityFailure.serverError());
    }
  }
}
