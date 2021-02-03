import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:md3/data/providers/shared_preferences_provider.dart';
import 'package:md3/data/repositories/buy_repository.dart';
import 'package:md3/logic/blocs/buy_bloc/state.dart';

class BuyBloc extends Cubit<BuyState> {
  BuyRepository _buyRepository;
  String phoneNumber;
  // Инициализация
  BuyBloc(this._buyRepository) : super(ProgressState()); // emit(загрузка)

  // Сделать заказ продукта
  Future<void> buyProduct(String productId, String count) async {
    try {
      // emit(загрузка)
      emit(ProgressState());
      // Если в куки не оказалось номера телефона (клиент не залогинелся),
      // то отправляем номер "АНОНИМНОГО КЛИЕНТА":
      phoneNumber = phoneNumber ?? '79999999999';

      var res = await _buyRepository.buyProduct(phoneNumber, productId, count,
          _buyRepository.tableId, _buyRepository.spotId ?? '1'); // test
      if (res) {
        print('Заказ успешно оформлен'); // test
        // emit(Ожидайте официанта)
        emit(SuccessOrderState());
      } else {
        emit(ErrorBuyState(errorInfo: 'Ошибка сервера #1'));
      }
    } catch (_) {
      emit(ErrorBuyState(errorInfo: 'Ошибка сервера #2'));
    }
    return;
  }

  // Подготовка данных для заказа продукта
  Future<void> prepairData({bool heyWaiter = false, bool init = false}) async {
    try {
      // 1. Сначала пытаемся получить id столика
      // Если столик не распознан
      if (_buyRepository.tableId == null) {
        print('Столик не распознан');
        // emit(столик_не_распознан)
        emit(UnknownTableState());
        return;
      } else {
        // 2. Затем пытаемся получить номер телефона клиента
        // Тягаем номер телефона клиента из куки
        final sharedPrefService =
            await SharedPreferencesService.instance; // куки
        phoneNumber = sharedPrefService.phoneNumber;
        // emit(подтвердите_заказ)
        init
            ? emit(WaiterOrMenuState())
            : heyWaiter
                ? emit(ConfirmHeyWaiterState())
                : emit(ConfirmOrderState());
      }
    } catch (_) {
      emit(ErrorBuyState(errorInfo: 'Ошибка сервера #3'));
    }
    return;
  }

  // Вызвать официанта
  Future<void> heyWaiter() async {
    String productId = '27'; // id продукта-вызов_персонала
    String count = '1';
    try {
      // emit(загрузка)
      emit(ProgressState());
      // Если в куки не оказалось номера телефона (клиент не залогинелся),
      // то отправляем номер "АНОНИМНОГО КЛИЕНТА":
      phoneNumber = phoneNumber ?? '79999999999';

      var res = await _buyRepository.buyProduct(phoneNumber, productId, count,
          _buyRepository.tableId, _buyRepository.spotId ?? '1'); // test
      if (res) {
        print('Официант успешно Вызван'); // test
        // emit(Ожидайте официанта)
        emit(SuccessHeyWaiteState());
      } else {
        emit(ErrorBuyState(errorInfo: 'Ошибка сервера #1'));
      }
    } catch (_) {
      emit(ErrorBuyState(errorInfo: 'Ошибка сервера #2'));
    }
    return;
  }
}
