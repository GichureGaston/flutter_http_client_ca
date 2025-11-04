part of 'client_bloc.dart';

@immutable
sealed class ClientState extends Equatable {
  const ClientState();

  @override
  List<Object> get props => [];
}

final class ClientInitial extends ClientState {}

final class ClientLoading extends ClientState {}

final class ClientSuccess extends ClientState {
  final String message;

  const ClientSuccess(this.message);

  @override
  List<Object> get props => [message];
}

final class ClientLoaded extends ClientState {
  final Client client;

  const ClientLoaded(this.client);

  @override
  List<Object> get props => [client];
}

final class ClientError extends ClientState {
  final String message;

  const ClientError(this.message);

  @override
  List<Object> get props => [message];
}
