import 'package:aau_service/domain/event/event.dart';
import 'package:aau_service/domain/event/event_failure.dart';
import 'package:aau_service/domain/event/event_form.dart';
import 'package:aau_service/domain/event/event_repository_interface.dart';
import 'package:aau_service/infrastructure/event/event_dto.dart';
import 'package:aau_service/infrastructure/event/event_provider.dart';
import 'package:dartz/dartz.dart';

class EventRepository implements EventRepositoryInterface {
  final EventProvider _eventProvider;

  EventRepository(this._eventProvider);

  @override
  Future<Either<EventFailure, List<Event>>> getEvents() async {
    try {
      final List<EventDto> events = await _eventProvider.getEvents();
      return right(events.map((e) => Event.fromJson(e.toJson())).toList());
    } catch (e) {
      return left(EventFailure.serverError());
    }
  }

  @override
  Future<Either<EventFailure, Event>> getEventById(String eventId) async {
    try {
      final EventDto event = await _eventProvider.getEvent(eventId);
      return right(Event.fromJson(event.toJson()));
    } catch (e) {
      return left(EventFailure.serverError());
    }
  }

  @override
  Future<Either<EventFailure, Event>> createEvent(EventForm event) async {
    try {
      final EventDto eventDto =
          await _eventProvider.createEvent(EventDto.fromJson(event.toJson()));
      return right(Event.fromJson(eventDto.toJson()));
    } catch (e) {
      return left(EventFailure.serverError());
    }
  }

  @override
  Future<Either<EventFailure, Event>> updateEvent(EventForm event) async {
    try {
      final EventDto eventDto =
          await _eventProvider.updateEvent(EventDto.fromJson(event.toJson()));
      return right(Event.fromJson(eventDto.toJson()));
    } catch (e) {
      return left(EventFailure.serverError());
    }
  }

  @override
  Future<Either<EventFailure, Unit>> deleteEvent(String eventId) async {
    try {
      await _eventProvider.deleteEvent(eventId);
      return right(unit);
    } catch (e) {
      return left(EventFailure.serverError());
    }
  }
}
