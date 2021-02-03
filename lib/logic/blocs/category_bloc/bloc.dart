import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:md3/data/models/product_pretty.dart';
import 'package:md3/data/repositories/product_repository.dart';
import 'package:md3/logic/blocs/category_bloc/state.dart';

class CategoryBloc extends Cubit<ProductState> {
  ProductRepository productRepository = ProductRepository();
  List<ProductPretty> cashProducts;
  String lastViewTypeProducts;
  // Инициализация
  CategoryBloc(/*Репозиторий*/) : super(ProductsEmptyState());

  Future<void> setType(String value) async {
    // if (value == '0') {
    //   emit(SetProductTypeState('0'));
    //   return;
    // }
    // if (value == '1') {
    //   emit(SetProductTypeState('1'));
    //   return;
    // }
    // if (value == '2') {
    //   emit(SetProductTypeState('2'));
    //   return;
    // }

    // // default
    // return SetProductTypeState('0');

    if (value == '0') {
      lastViewTypeProducts = value; // Запоминаем категорию продуктов
      // Был ли загруен список продуктов
      if (cashProducts != null) {
        emit(SetCategoryProductState(
          '7',
          cashProducts
              .where((element) => element.menuCategoryId == '7')
              .toList(),
        ));
      } else {
        print('Список продуктов ещё не загружен');
      }
      return;
    }

    if (value == '1') {
      lastViewTypeProducts = value; // Запоминаем категорию продуктов
      // Был ли загруен список продуктов
      if (cashProducts != null) {
        emit(SetCategoryProductState(
          '8',
          cashProducts
              .where((element) => element.menuCategoryId == '8')
              .toList(),
        ));
      } else {
        print('Список продуктов ещё не загружен');
      }
      return;
    }

    if (value == '2') {
      lastViewTypeProducts = value; // Запоминаем категорию продуктов
      // Был ли загруен список продуктов
      if (cashProducts != null) {
        emit(SetCategoryProductState(
          '4',
          cashProducts
              .where((element) => element.menuCategoryId == '4')
              .toList(),
        ));
      } else {
        print('Список продуктов ещё не загружен');
      }
      return;
    }
    // default
    // Был ли загруен список продуктов
    if (cashProducts != null) {
      emit(SetCategoryProductState(
        '7',
        cashProducts.where((element) => element.menuCategoryId == '7').toList(),
      ));
    } else {
      print('Список продуктов ещё не загружен');
    }
    return;
  }

  // Загрузка списка продуктов
  Future<void> fetchProducts() async {
    try {
      emit(ProductsLoadingState());
      // Загружаем с свервера список продуктов
      final List<ProductPretty> products =
          await productRepository.getAllProducts();
      // await Future.delayed(Duration(seconds: 5)); // эмитация загрузки данных
      cashProducts = products; // Сохраняем в оперативной памяти
      // emit(ProductsLoadedState());
      // Проверяем, был ли изменён пункт списка категорий, пока загружались данные
      setType(lastViewTypeProducts ?? '0'); // Показываем продукты
    } catch (_) {
      emit(ProductsErrorState());
    }
    return;
  }
}
