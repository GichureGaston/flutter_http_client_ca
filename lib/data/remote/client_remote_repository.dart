import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_client/data/models/client_model.dart';

abstract class ClientRemoteRepository {
  Future<ClientModel> getClient(int id);
  Future<ClientModel> createClient(ClientModel client);
  Future<ClientModel> updateClient(ClientModel client);
  Future<void> deleteClient(int id);
}

class ClientRemoteDataImpl implements ClientRemoteRepository {
  final http.Client httpClient;
  final String baseUrl = '';

  ClientRemoteDataImpl({required this.httpClient});

  @override
  Future<ClientModel> getClient(int id) async {
    final response = await httpClient.get(Uri.parse('$baseUrl/clients/$id'));

    if (response.statusCode == 200) {
      return ClientModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get client');
    }
  }

  @override
  Future<ClientModel> createClient(ClientModel client) async {
    final response = await httpClient.post(
      Uri.parse('$baseUrl/clients'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(client.toJson()),
    );

    if (response.statusCode == 201) {
      return ClientModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create client');
    }
  }

  @override
  Future<ClientModel> updateClient(ClientModel client) async {
    final response = await httpClient.put(
      Uri.parse('$baseUrl/clients/${client.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(client.toJson()),
    );

    if (response.statusCode == 200) {
      return ClientModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update client');
    }
  }

  @override
  Future<void> deleteClient(int id) async {
    final response = await httpClient.delete(Uri.parse('$baseUrl/clients/$id'));

    if (response.statusCode != 204) {
      throw Exception('Failed to delete client');
    }
  }
}
