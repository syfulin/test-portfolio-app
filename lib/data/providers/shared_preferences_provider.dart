import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferencesService._internal();

  static SharedPreferencesService _instance;
  static SharedPreferences _preferences;

  // Инициализация инстанса...
  static Future<SharedPreferencesService> get instance async {
    // .. текущего класса
    if (_instance == null) {
      _instance = SharedPreferencesService._internal();
    }

    // .. класса SharedPreferences
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }

    return _instance;
  }

  Future<void> setClientId(String clientId) async =>
      await _preferences.setString('md.client_id', clientId);

  String get clientId => _preferences.getString('md.client_id');

  Future<void> setPhoneNumber(String phoneNumber) async =>
      await _preferences.setString('md.phone_number', phoneNumber);

  Future<void> removePhoneNumber() async =>
      await _preferences.remove('md.phone_number');

  String get phoneNumber => _preferences.getString('md.phone_number');
}
