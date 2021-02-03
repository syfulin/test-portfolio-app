import 'package:md3/data/models/product_pretty.dart';
import 'package:md3/data/providers/service_api_provider.dart';

class ProductRepository {
  ServiceApiProvider _productProvider = ServiceApiProvider();
  Future<List<ProductPretty>> getAllProducts() =>
      _productProvider.getProducts();
}
