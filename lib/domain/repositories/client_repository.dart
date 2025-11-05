import '../entities/client.dart';

abstract class ClientRepository {
  Future<Client> getClient(String id);
  Future<void> deleteClient(String id);
  Future<Client> createClient(Client client);
  Future<Client> updateClient(Client client);
}
