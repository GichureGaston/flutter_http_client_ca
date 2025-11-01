import '../entities/client.dart';

abstract class ClientRepository {
  Future<Client> getClient(int id);
  Future<void> deleteClient(int id);
  Future<Client> createClient(Client client);
  Future<Client> updateClient(Client client);
}
