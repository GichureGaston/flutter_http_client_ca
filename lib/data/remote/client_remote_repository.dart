import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_client/data/models/client_model.dart';
import 'package:injectable/injectable.dart';

abstract class ClientRemoteRepository {
  Future<ClientModel> getClient(String id);
  Future<ClientModel> createClient(ClientModel client);
  Future<ClientModel> updateClient(ClientModel client);
  Future<void> deleteClient(String id);
}

@LazySingleton(as: ClientRemoteRepository)
class ClientRemoteDataImpl implements ClientRemoteRepository {
  final http.Client httpClient;
  final String baseUrl;

  ClientRemoteDataImpl({
    required this.httpClient,
    @Named('baseUrl') required this.baseUrl,
  });

  @override
  Future<ClientModel> getClient(String id) async {
    final response = await httpClient.get(Uri.parse('$baseUrl/users/$id'));

    if (response.statusCode == 200) {
      return ClientModel.fromJson(json.decode(response.body));
    } else {
      throw Exception(
        'Failed to get client. Status code: ${response.statusCode}, Body: ${response.body}',
      );
    }
  }

  @override
  Future<ClientModel> createClient(ClientModel client) async {
    final response = await httpClient.post(
      Uri.parse('$baseUrl/users'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(client.toJson()),
    );

    if (response.statusCode == 201) {
      return ClientModel.fromJson(json.decode(response.body));
    } else {
      throw Exception(
        'Failed to create client. Status code: ${response.statusCode}, Body: ${response.body}',
      );
    }
  }

  @override
  Future<ClientModel> updateClient(ClientModel client) async {
    final response = await httpClient.put(
      Uri.parse('$baseUrl/users/${client.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(client.toJson()),
    );

    if (response.statusCode == 200) {
      return ClientModel.fromJson(json.decode(response.body));
    } else {
      throw Exception(
        'Failed to update client. Status code: ${response.statusCode}, Body: ${response.body}',
      );
    }
  }

  @override
  Future<void> deleteClient(String id) async {
    final response = await httpClient.delete(Uri.parse('$baseUrl/users/$id'));

    if (response.statusCode != 204 && response.statusCode != 200) {
      throw Exception(
        'Failed to delete client. Status code: ${response.statusCode}, Body: ${response.body}',
      );
    }
  }
}
