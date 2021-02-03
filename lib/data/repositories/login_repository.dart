import 'package:md3/data/providers/service_api_provider.dart';

class LoginRepository {
  ServiceApiProvider _loginProvider = ServiceApiProvider();
  Future<Map<String, dynamic>> login(String phoneNumber) =>
      _loginProvider.getOrCreateUser(phoneNumber);
}
