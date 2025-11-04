import 'package:http_client/domain/entities/client.dart';
import 'package:http_client/domain/repositories/client_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateClientUseCase {
  final ClientRepository repository;

  UpdateClientUseCase(this.repository);

  Future<Client> call(Client client) {
    return repository.updateClient(client);
  }
}
