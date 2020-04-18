import 'package:http/http.dart' as http;

abstract class AuthBase {
  http.BaseClient _client;
  http.BaseClient get client => _client;
}
