import 'package:http_client/domain/entities/client.dart';
import 'package:http_client/domain/repositories/client_repository.dart';
import 'package:injectable/injectable.dart';

import '../models/client_model.dart';
import '../remote/client_remote_repository.dart';

@LazySingleton(as: ClientRepository)
class ClientRemoteRepoImp implements ClientRepository {
  final ClientRemoteRepository remoteDataSource;

  ClientRemoteRepoImp({required this.remoteDataSource});

  @override
  Future<Client> getClient(int id) async {
    final clientModel = await remoteDataSource.getClient(id);
    return clientModel.toEntity();
  }

  @override
  Future<Client> createClient(Client client) async {
    final clientModel = ClientModel(
      id: client.id,
      name: client.name,
      email: client.email,
    );
    final resultModel = await remoteDataSource.createClient(clientModel);
    return resultModel.toEntity();
  }

  @override
  Future<Client> updateClient(Client client) async {
    final clientModel = ClientModel(
      id: client.id,
      name: client.name,
      email: client.email,
    );
    final resultModel = await remoteDataSource.updateClient(clientModel);
    return resultModel.toEntity();
  }

  @override
  Future<void> deleteClient(int id) {
    return remoteDataSource.deleteClient(id);
  }
}
