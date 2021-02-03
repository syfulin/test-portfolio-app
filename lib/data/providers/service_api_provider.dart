import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:md3/data/models/product_pretty.dart';

class ServiceApiProvider {
  // http://127.0.0.1:5577/api/1abcdef/getAllProducts
  var urlLocalHost = 'http://127.0.0.1:5577/api/1abcdef/getAllProducts';
  var urlProd = 'https://qrmbot.xyz/api/1abcdef/getAllProducts';

  var urlLocalHost2 = 'http://127.0.0.1:5577/api/1abcdef/loginClient';
  var urlProd2 = 'https://qrmbot.xyz/api/1abcdef/loginClient';

  var urlLocalHost3 = 'http://127.0.0.1:5577/api/1abcdef/buyProduct';
  var urlProd3 = 'https://qrmbot.xyz/api/1abcdef/buyProduct';

  // Получение списка продуктов
  Future<List<ProductPretty>> getProducts() async {
    final response = await http.get(urlProd);
    if (response.statusCode == 200 && jsonDecode(response.body)['ok'] == true) {
      final List<dynamic> productsJson = jsonDecode(response.body)['result'];
      return productsJson.map((json) => ProductPretty.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching products');
    }
  }

  // Получение данных клиента по номеру телефона / Регистрация клиента
  Future<Map<String, dynamic>> getOrCreateUser(String phoneNumber) async {
    final response = await http.get(urlProd2 + '?phone=$phoneNumber');
    if (response.statusCode == 200 && jsonDecode(response.body)['ok'] == true) {
      Map<String, dynamic> user = jsonDecode(response.body)['result'];
      return user;
    } else {
      throw Exception('Error login');
    }
  }

  // Покупка продукта
  Future<bool> buyProduct(
    String phoneNumber,
    String productId,
    String countProduct,
    String tableId,
    String spotId,
  ) async {
    final response = await http.get(urlProd3 +
        '?phone=$phoneNumber' +
        '&product_id=$productId' +
        '&count=$countProduct' +
        '&table_id=$tableId' +
        '&spot_id=$spotId');
    if (response.statusCode == 200 && jsonDecode(response.body)['ok'] == true) {
      return true;
      // Map<String, dynamic> result = jsonDecode(response.body)['result'];
      // return result;
    } else {
      throw Exception('Error login');
    }
  }
}
