import 'package:http_client/domain/entities/client.dart';
import 'package:http_client/domain/repositories/client_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetClientUseCase {
  final ClientRepository repository;

  GetClientUseCase(this.repository);

  Future<Client> call(String id) {
    return repository.getClient(id);
  }
}
