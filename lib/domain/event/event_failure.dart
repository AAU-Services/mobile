class EventFailure {
  const EventFailure._();

  factory EventFailure.serverError() = ServerError;
  factory EventFailure.networkError() = NetworkError;
  factory EventFailure.unauthorized() = Unauthorized;
  factory EventFailure.notFound() = NotFound;
  factory EventFailure.permissionDenied() = PermissionDenied;
  factory EventFailure.forbidden() = Forbidden;
  factory EventFailure.emptyTitleError() = EmptyTitleError;
  factory EventFailure.emptyDescriptionError() = EmptyDescriptionError;
  factory EventFailure.emptyDateError() = EmptyDateError;
  factory EventFailure.emptyAddressError() = EmptyAddressError;
  factory EventFailure.validationError(String message) = ValidationError;
  factory EventFailure.customError(String message) = CustomError;
}

class ServerError extends EventFailure {
  const ServerError() : super._();
}

class NetworkError extends EventFailure {
  const NetworkError() : super._();
}

class Unauthorized extends EventFailure {
  const Unauthorized() : super._();
}

class NotFound extends EventFailure {
  const NotFound() : super._();
}

class PermissionDenied extends EventFailure {
  const PermissionDenied() : super._();
}

class Forbidden extends EventFailure {
  const Forbidden() : super._();
}

class EmptyTitleError extends EventFailure {
  const EmptyTitleError() : super._();
}

class EmptyDescriptionError extends EventFailure {
  const EmptyDescriptionError() : super._();
}

class EmptyDateError extends EventFailure {
  const EmptyDateError() : super._();
}

class EmptyAddressError extends EventFailure {
  const EmptyAddressError() : super._();
}

class ValidationError extends EventFailure {
  final String message;
  const ValidationError(this.message) : super._();
}

class CustomError extends EventFailure {
  final String message;
  const CustomError(this.message) : super._();
}
