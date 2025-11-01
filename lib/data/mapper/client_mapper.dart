import 'package:http_client/data/models/client_model.dart';

import '../../domain/entities/client.dart';

extension ClientEntityMapper on Client {
  ClientModel toModel() {
    return ClientModel(id: id, name: name, email: email);
  }
}

extension ClientModelMapper on ClientModel {
  Client toEntity() {
    return Client(id: id, name: name, email: email);
  }
}
