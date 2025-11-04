import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@module
abstract class InjectionModule {
  @lazySingleton
  http.Client get httpClient => http.Client();
  @Named('baseUrl')
  @lazySingleton
  String get baseUrl => dotenv.env['BASE_URL']!;
}
