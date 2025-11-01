import '../repositories/client_repository.dart';

class DeleteClientUseCase {
  final ClientRepository clientRepository;
  DeleteClientUseCase(this.clientRepository);
  Future<void> call(int id) {
    return clientRepository.deleteClient(id);
  }
}
