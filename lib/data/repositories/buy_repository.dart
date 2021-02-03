// Покупка товара
import 'package:md3/data/providers/service_api_provider.dart';

class BuyRepository {
  // id столика
  String tableId;

  // id филиала
  String spotId;

  // Через конструктор опционально задаётся id столика
  BuyRepository({this.tableId, this.spotId});

  ServiceApiProvider _serviceApiProvider = ServiceApiProvider();
  Future<bool> buyProduct(
    String phoneNumber,
    String productId,
    String countProduct,
    String tableId,
    String spotId,
  ) =>
      _serviceApiProvider.buyProduct(
        phoneNumber,
        productId,
        countProduct,
        tableId,
        spotId,
      );
}
