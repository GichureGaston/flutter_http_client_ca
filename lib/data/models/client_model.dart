import 'package:http_client/domain/entities/client.dart';
import 'package:json_annotation/json_annotation.dart';

part 'client_model.g.dart';

@JsonSerializable(checked: true)
class ClientModel {
  final int id;
  final String name;
  final String email;

  ClientModel({required this.id, required this.name, required this.email});

  factory ClientModel.fromJson(Map<String, dynamic> json) =>
      _$ClientModelFromJson(json);
  Map<String, dynamic> toJson() => _$ClientModelToJson(this);

  Client toEntity() {
    return Client(id: id, name: name, email: email);
  }
}
