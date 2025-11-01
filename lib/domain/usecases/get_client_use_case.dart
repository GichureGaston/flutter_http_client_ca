import 'package:http_client/domain/repositories/client_repository.dart';

import '../entities/client.dart';

class GetClientUseCase {
  final ClientRepository clientRepository;
  GetClientUseCase(this.clientRepository);
  Future<Client> call(int id) {
    return clientRepository.getClient(id);
  }
}
