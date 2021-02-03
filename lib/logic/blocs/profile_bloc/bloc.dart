import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:md3/data/providers/shared_preferences_provider.dart';
import 'package:md3/data/repositories/login_repository.dart';
import 'package:md3/logic/blocs/profile_bloc/state.dart';

class ProfileBloc extends Cubit<ProfileState> {
  LoginRepository _loginRepository = LoginRepository();
  // ! В куки сохранять не номер телефона, а id клиента? (похоже, что да)
  String currentPhoneNumber; // типа куки
  // Инициализация
  ProfileBloc(/*Репозиторий*/) : super(LogoutedState());

  // ! Логин/регистрация по номеру телефона из формы
  Future<void> login(String phoneNumber) async {
    if (phoneNumber.length == 0) {
      emit(ErrorLoginState(errorInfo: 'Введите номер телефона'));
      return;
    }

    try {
      final sharedPrefService = await SharedPreferencesService.instance; // куки
      // i Показываем индикатор загрузки:
      emit(LoginState());
      // Обращаемся к микросервису
      Map<String, dynamic> user = await _loginRepository.login(phoneNumber);
      // print(user);
      // Вход успешен?
      //  // да
      //    // Сохраняем в куки данные пользователя
      sharedPrefService.setPhoneNumber(user['phone']);
      // currentPhoneNumber = user['phone_number'];
      //    // i Показываем профиль с данными
      emit(LoginedState(user: user));
    } catch (e) {
      // i Форму логина + текст с ошибкой
      // Ошибка входа
      emit(ErrorLoginState(errorInfo: e.toString())); // test
      // print(e.toString());
    }
  }

  // Авто логин (обновление даных) (с client_id из куки)
  // !  Авто логин (обновление даных) по id из куки
  Future<void> autoLogin() async {
    final sharedPrefService = await SharedPreferencesService.instance; // куки
    final currentPhoneNumber = sharedPrefService.phoneNumber;
    // print(sharedPrefService.phoneNumber);

    if (currentPhoneNumber != null) {
      emit(LoginState());
      // ! Вместо этого метода получать клиента по его id
      Map<String, dynamic> user =
          await _loginRepository.login(currentPhoneNumber);
      sharedPrefService.setPhoneNumber(user['phone']);
      // currentPhoneNumber = user['phone_number'];
      emit(LoginedState(user: user));
    } else {
      emit(LogoutedState());
    }
  }

  // Выход из аккаунта
  Future<void> logout() async {
    final sharedPrefService = await SharedPreferencesService.instance; // куки
    // i Показать игдикатор загрузки
    LogoutState();
    // i Очистить куки
    sharedPrefService.removePhoneNumber();
    // currentPhoneNumber = null;
    // i Показать страницу логина
    emit(LogoutedState());
  }

  // Future<void> setContent(String value) async {
  //   if (value == 'profile') {
  //     emit(SetContentTypeState('profile'));
  //     return;
  //   }
  //   if (value == 'menu') {
  //     emit(SetContentTypeState('menu'));
  //     return;
  //   }
  //   if (value == 'terms') {
  //     emit(SetContentTypeState('terms'));
  //     return;
  //   }
  //   if (value == 'clock') {
  //     emit(SetContentTypeState('clock'));
  //     return;
  //   }
  //   if (value == 'price') {
  //     emit(SetContentTypeState('price'));
  //     return;
  //   }
  //   if (value == 'about') {
  //     emit(SetContentTypeState('about'));
  //     return;
  //   }
  //   if (value == 'null') {
  //     emit(SetContentTypeState('null'));
  //     return;
  //   }

  //   // default
  //   return SetContentTypeState('about');
  // }
}
