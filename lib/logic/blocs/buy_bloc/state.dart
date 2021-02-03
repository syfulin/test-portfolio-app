import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class BuyState extends Equatable {}

// Индикатор загрузки
class ProgressState extends BuyState {
  @override
  List<Object> get props => [];
}

// Столик не распознан
class UnknownTableState extends BuyState {
  @override
  List<Object> get props => [];
}

// Подтвердите заказ
class ConfirmOrderState extends BuyState {
  @override
  List<Object> get props => [];
}

// Подтвердите вызов персонала
class ConfirmHeyWaiterState extends BuyState {
  @override
  List<Object> get props => [];
}

// Вызвать официанта или показать меню?
class WaiterOrMenuState extends BuyState {
  @override
  List<Object> get props => [];
}

// Персонал успешно вызван
class SuccessHeyWaiteState extends BuyState {
  @override
  List<Object> get props => [];
}

// Заказ успешно оформлен
class SuccessOrderState extends BuyState {
  @override
  List<Object> get props => [];
}

// Ошибка оформления заказ
class ErrorBuyState extends BuyState {
  final String errorInfo;
  ErrorBuyState({@required this.errorInfo});
  @override
  List<Object> get props => [errorInfo];
}
