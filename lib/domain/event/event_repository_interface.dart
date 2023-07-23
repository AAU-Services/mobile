import 'package:dartz/dartz.dart';
import 'package:aau_service/domain/event/event.dart';
import 'package:aau_service/domain/event/event_failure.dart';
import 'package:aau_service/domain/event/event_form.dart';

abstract class EventRepositoryInterface {
  Future<Either<EventFailure, List<Event>>> getEvents();
  Future<Either<EventFailure, Event>> getEventById(String eventId);
  Future<Either<EventFailure, Event>> createEvent(EventForm event);
  Future<Either<EventFailure, Event>> updateEvent(EventForm event);
  Future<Either<EventFailure, Unit>> deleteEvent(String eventId);
}
