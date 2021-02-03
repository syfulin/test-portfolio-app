import 'package:equatable/equatable.dart';
import 'package:md3/data/models/product_pretty.dart';

abstract class ProductState extends Equatable {}

// Состояние завершения обновления контента
class SetCategoryProductState extends ProductState {
  final String productType;
  final List<ProductPretty> products;

  SetCategoryProductState(this.productType, this.products);

  @override
  List<Object> get props => [productType, products];
}

// Состояние начала загрузки списка продуктов
class ProductsLoadingState extends ProductState {
  @override
  List<Object> get props => [];
}

// Состояние окончания загрузки списка продуктов
class ProductsLoadedState extends ProductState {
  @override
  List<Object> get props => [];
}

// Состояние ошибки загрузки списка продуктов
class ProductsErrorState extends ProductState {
  @override
  List<Object> get props => [];
}

// Состояние пустого списка продуктов
class ProductsEmptyState extends ProductState {
  @override
  List<Object> get props => [];
}
