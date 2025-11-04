import 'package:http_client/domain/repositories/client_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteClientUseCase {
  final ClientRepository repository;

  DeleteClientUseCase(this.repository);

  Future<void> call(int id) {
    return repository.deleteClient(id);
  }
}
