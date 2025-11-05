part of 'client_bloc.dart';

@immutable
sealed class ClientEvent extends Equatable {
  const ClientEvent();

  @override
  List<Object> get props => [];
}

class GetClient extends ClientEvent {
  final String id;

  const GetClient(this.id);

  @override
  List<Object> get props => [id];
}

class CreateClient extends ClientEvent {
  final Client client;

  const CreateClient(this.client);

  @override
  List<Object> get props => [client];
}

class UpdateClient extends ClientEvent {
  final Client client;

  const UpdateClient(this.client);

  @override
  List<Object> get props => [client];
}

class DeleteClient extends ClientEvent {
  final String id;

  const DeleteClient(this.id);

  @override
  List<Object> get props => [id];
}
