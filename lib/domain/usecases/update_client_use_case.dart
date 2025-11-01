import 'package:http_client/domain/repositories/client_repository.dart';

import '../entities/client.dart';

class UpdateClientUseCase {
  final ClientRepository clientRepository;
  UpdateClientUseCase(this.clientRepository);
  Future<Client> call(Client client) {
    return clientRepository.createClient(client);
  }
}
