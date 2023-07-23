import 'package:equatable/equatable.dart';

class CampusFailure implements Equatable {
  final String message;

  CampusFailure.serverError(
      {this.message = "Something went wrong, please try again later."});
  CampusFailure.networkError(
      {this.message = "Please check your internet connection and try again."});
  CampusFailure.unexpectedError(
      {this.message = "An unexpected error occured, please try again later."});

  @override
  List<Object> get props => [message];

  @override
  bool? get stringify => true;
}
