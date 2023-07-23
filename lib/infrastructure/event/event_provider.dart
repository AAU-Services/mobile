import 'dart:convert';

import 'package:aau_service/infrastructure/event/event_dto.dart';
import 'package:aau_service/util/custom_http_client.dart';

class EventProvider {
  final CustomHttpClient _httpClient;

  EventProvider(this._httpClient);

  Future<List<EventDto>> getEvents() async {
    final response = await _httpClient.get("event");
    if (response.statusCode == 200) {
      final List<dynamic> events = jsonDecode(response.body);
      return events.map((e) => EventDto.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load events");
    }
  }

  Future<EventDto> getEvent(String id) async {
    final response = await _httpClient.get("event/$id");
    if (response.statusCode == 200) {
      final Map<String, dynamic> event = jsonDecode(response.body);
      return EventDto.fromJson(event);
    } else {
      throw Exception("Failed to load event");
    }
  }

  Future<EventDto> createEvent(EventDto event) async {
    final response = await _httpClient.post("event", event.toJson());
    if (response.statusCode == 201) {
      final Map<String, dynamic> event = jsonDecode(response.body);
      return EventDto.fromJson(event);
    } else {
      throw Exception("Failed to create event");
    }
  }

  Future<EventDto> updateEvent(EventDto event) async {
    final response = await _httpClient.put("event/${event.id}", event.toJson());
    if (response.statusCode == 200) {
      final Map<String, dynamic> event = jsonDecode(response.body);
      return EventDto.fromJson(event);
    } else {
      throw Exception("Failed to update event");
    }
  }

  Future<void> deleteEvent(String id) async {
    final response = await _httpClient.delete("event/$id");
    if (response.statusCode != 204) {
      throw Exception("Failed to delete event");
    }
  }
}
