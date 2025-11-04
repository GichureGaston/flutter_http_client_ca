import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http_client/domain/entities/client.dart';
import 'package:http_client/domain/usecases/create_client_use_case.dart';
import 'package:http_client/domain/usecases/delete_client_use_case.dart';
import 'package:http_client/domain/usecases/get_client_use_case.dart';
import 'package:http_client/domain/usecases/update_client_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'client_event.dart';
part 'client_state.dart';

@injectable
class ClientBloc extends Bloc<ClientEvent, ClientState> {
  final GetClientUseCase getClientUseCase;
  final CreateClientUseCase createClientUseCase;
  final UpdateClientUseCase updateClientUseCase;
  final DeleteClientUseCase deleteClientUseCase;

  ClientBloc(
    this.getClientUseCase,
    this.createClientUseCase,
    this.updateClientUseCase,
    this.deleteClientUseCase,
  ) : super(ClientInitial()) {
    on<GetClient>((event, emit) async {
      emit(ClientLoading());
      try {
        final client = await getClientUseCase(event.id);
        emit(ClientLoaded(client));
      } catch (e) {
        print('Error fetching client: $e');
        emit(ClientError(e.toString()));
      }
    });

    on<CreateClient>((event, emit) async {
      emit(ClientLoading());
      try {
        final client = await createClientUseCase(event.client);
        emit(ClientLoaded(client));
      } catch (e) {
        print('Error creating client: $e');
        emit(ClientError(e.toString()));
      }
    });

    on<UpdateClient>((event, emit) async {
      emit(ClientLoading());
      try {
        final client = await updateClientUseCase(event.client);
        emit(ClientLoaded(client));
      } catch (e) {
        print('Error updating client: $e');
        emit(ClientError(e.toString()));
      }
    });

    on<DeleteClient>((event, emit) async {
      emit(ClientLoading());
      try {
        await deleteClientUseCase(event.id);
        emit(const ClientSuccess('Client deleted successfully!'));
      } catch (e) {
        print('Error deleting client: $e');
        emit(ClientError(e.toString()));
      }
    });
  }
}
