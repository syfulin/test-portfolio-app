// Всплывающее окно
import 'package:flutter/material.dart';
import 'package:md3/logic/blocs/buy_bloc/bloc.dart';
import 'package:md3/logic/blocs/buy_bloc/state.dart';
import 'package:md3/view/components/animation/my_blur_page2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:md3/view/screens/commit/confirm_hey_waiter.dart';
import 'package:md3/view/screens/commit/confirm_order.dart';
import 'package:md3/view/screens/commit/error_order.dart';
import 'package:md3/view/screens/commit/progress.dart';
import 'package:md3/view/screens/commit/success_hey_waiter.dart';
import 'package:md3/view/screens/commit/success_order.dart';
import 'package:md3/view/screens/commit/unknown_table.dart';
import 'package:md3/view/screens/commit/waiter_or_menu.dart';

// Основная область, в которой переключаются страницы:
// 1. 'Прогресс'
// 2. 'Столик не распознан'
// 3. 'Подтверждение заказа'
// 4. 'Ожидайте официанта'
// 5. 'Ошибка заказа'
class CommitAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Получение данных с предыдущего экрана:
    final Map<String, dynamic> orderData =
        ModalRoute.of(context).settings.arguments;

    return GestureDetector(
      onTap: () {
        MyBlurPage2.pop(context); // Опционально
      },
      child: Material(
        color: Colors.transparent,
        child: Center(
          child: GestureDetector(
            onTap: () {}, // Пергрузка
            child: Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 32, 32, 32),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: BlocBuilder<BuyBloc, BuyState>(
                builder: (context, state) {
                  if (state is UnknownTableState) {
                    return unknownTable(context);
                  }

                  if (state is ProgressState) {
                    return indicator();
                  }

                  if (state is ConfirmOrderState) {
                    return confirmOrder(context, orderData);
                  }

                  if (state is SuccessOrderState) {
                    return successOrder(context);
                  }

                  if (state is ErrorBuyState) {
                    return errorOrder(context, state.errorInfo);
                  }

                  // Вызов персонала:
                  if (state is ConfirmHeyWaiterState) {
                    return confirmHeyWaiter(context);
                  }
                  if (state is SuccessHeyWaiteState) {
                    return successHeyWaite(context);
                  }

                  // Вызвать официанта или показать меню:
                  if (state is WaiterOrMenuState) {
                    return waiterOrMenuState(context);
                  }

                  return indicator();
                },
              ),
              // child: confirmOrder(context, orderData),
              // child: indicator(),
              // child: unknownTable(context),
              // child: errorOrder(context),
              // child: successOrder(context),
            ),
          ),
        ),
      ),
    );
  }
}
