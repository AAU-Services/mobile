import 'package:dartz/dartz.dart';
import 'package:aau_service/domain/opportunity/opportunity_form.dart';
import 'package:aau_service/domain/opportunity/opportunity.dart';
import 'package:aau_service/domain/opportunity/opportunity_failure.dart';

abstract class OpportunityRepositoryInterface {
  Future<Either<OpportunityFailure, List<Opportunity>>> getOpportunities();
  Future<Either<OpportunityFailure, Opportunity>> getOpportunityById(
      String opportunityId);
  Future<Either<OpportunityFailure, Opportunity>> createOpportunity(
      OpportunityForm opportunity);
  Future<Either<OpportunityFailure, Opportunity>> updateOpportunity(
      OpportunityForm opportunity);
  Future<Either<OpportunityFailure, Unit>> deleteOpportunity(
      String opportunityId);
}
