import 'package:http_client/domain/repositories/client_repository.dart';

import '../entities/client.dart';

class CreateClientUseCase {
  final ClientRepository clientRepository;
  CreateClientUseCase(this.clientRepository);
  Future<Client> call(Client client) {
    return clientRepository.createClient(client);
  }
}
