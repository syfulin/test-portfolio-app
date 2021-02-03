import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

// Состояния LogIn
abstract class ProfileState extends Equatable {}

// Не выполнен входа в аккаунт
class LogoutedState extends ProfileState {
  @override
  List<Object> get props => [];
}

// Вход в аккаунт
class LoginState extends ProfileState {
  @override
  List<Object> get props => [];
}

// Выполнен вход в аккаунт
class LoginedState extends ProfileState {
  final Map<String, dynamic> user;
  LoginedState({@required this.user});
  @override
  List<Object> get props => [user];
}

// Выход из аккаунта
class LogoutState extends ProfileState {
  @override
  List<Object> get props => [];
}

// Ошибка входа в аккаунт
class ErrorLoginState extends ProfileState {
  final String errorInfo;
  ErrorLoginState({@required this.errorInfo});
  @override
  List<Object> get props => [errorInfo];
}
