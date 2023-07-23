import 'dart:convert';

import 'package:aau_service/infrastructure/opportunity/opportunity_dto.dart';
import 'package:aau_service/util/custom_http_client.dart';

class OpportunityProvider {
  final CustomHttpClient _httpClient;

  OpportunityProvider(this._httpClient);

  Future<List<OpportunityDto>> getOpportunities() async {
    final response = await _httpClient.get("opportunity");
    if (response.statusCode == 200) {
      final List<dynamic> opportunities = jsonDecode(response.body);
      return opportunities.map((e) => OpportunityDto.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load opportunities");
    }
  }

  Future<OpportunityDto> getOpportunity(String id) async {
    final response = await _httpClient.get("opportunity/$id");
    if (response.statusCode == 200) {
      final Map<String, dynamic> opportunity = jsonDecode(response.body);
      return OpportunityDto.fromJson(opportunity);
    } else {
      throw Exception("Failed to load opportunity");
    }
  }

  Future<OpportunityDto> createOpportunity(OpportunityDto opportunity) async {
    final response =
        await _httpClient.post("opportunity", opportunity.toJson());
    if (response.statusCode == 201) {
      final Map<String, dynamic> opportunity = jsonDecode(response.body);
      return OpportunityDto.fromJson(opportunity);
    } else {
      throw Exception("Failed to create opportunity");
    }
  }

  Future<OpportunityDto> updateOpportunity(OpportunityDto opportunity) async {
    final response = await _httpClient.put(
        "opportunity/${opportunity.id}", opportunity.toJson());
    if (response.statusCode == 200) {
      final Map<String, dynamic> opportunity = jsonDecode(response.body);
      return OpportunityDto.fromJson(opportunity);
    } else {
      throw Exception("Failed to update opportunity");
    }
  }

  Future<void> deleteOpportunity(String id) async {
    final response = await _httpClient.delete("opportunity/$id");
    if (response.statusCode != 204) {
      throw Exception("Failed to delete opportunity");
    }
  }
}
