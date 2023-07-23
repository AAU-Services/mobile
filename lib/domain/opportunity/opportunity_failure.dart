class OpportunityFailure {
  const OpportunityFailure._();

  factory OpportunityFailure.serverError() = ServerError;
  factory OpportunityFailure.networkError() = NetworkError;
  factory OpportunityFailure.unauthorized() = Unauthorized;
  factory OpportunityFailure.notFound() = NotFound;
  factory OpportunityFailure.permissionDenied() = PermissionDenied;
  factory OpportunityFailure.forbidden() = Forbidden;
  factory OpportunityFailure.emptyTitleError() = EmptyTitleError;
  factory OpportunityFailure.emptyDescriptionError() = EmptyDescriptionError;
  factory OpportunityFailure.validationError(String message) = ValidationError;
  factory OpportunityFailure.customError(String message) = CustomError;
}

class ServerError extends OpportunityFailure {
  const ServerError() : super._();
}

class NetworkError extends OpportunityFailure {
  const NetworkError() : super._();
}

class Unauthorized extends OpportunityFailure {
  const Unauthorized() : super._();
}

class NotFound extends OpportunityFailure {
  const NotFound() : super._();
}

class PermissionDenied extends OpportunityFailure {
  const PermissionDenied() : super._();
}

class Forbidden extends OpportunityFailure {
  const Forbidden() : super._();
}

class EmptyTitleError extends OpportunityFailure {
  const EmptyTitleError() : super._();
}

class EmptyDescriptionError extends OpportunityFailure {
  const EmptyDescriptionError() : super._();
}

class ValidationError extends OpportunityFailure {
  final String message;
  const ValidationError(this.message) : super._();
}

class CustomError extends OpportunityFailure {
  final String message;
  const CustomError(this.message) : super._();
}
