import 'package:equatable/equatable.dart';

const String serverErrorMessage = 'Something went wrong on the server';
const String cacheErrorMessage = 'Something went wrong on the local database';

class Failure extends Equatable {
  final String? message;

  const Failure(this.message);
  @override
  List<Object?> get props => [message];
}
