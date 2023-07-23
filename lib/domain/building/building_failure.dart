import 'package:equatable/equatable.dart';

class BuildingFailure implements Equatable {
  final String message;

  BuildingFailure.serverError(
      {this.message = "Something went wrong, please try again later."});
  BuildingFailure.networkError(
      {this.message = "Please check your internet connection and try again."});
  BuildingFailure.unexpectedError(
      {this.message = "An unexpected error occured, please try again later."});

  @override
  List<Object> get props => [message];

  @override
  bool? get stringify => true;
}
