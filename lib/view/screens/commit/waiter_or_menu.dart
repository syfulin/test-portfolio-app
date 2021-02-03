import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:md3/logic/blocs/buy_bloc/bloc.dart';
import 'package:md3/view/components/animation/my_blur_page2.dart';

Widget waiterOrMenuState(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    mainAxisSize: MainAxisSize.min,
    children: [
      // Кнопки действий
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 25),
          GestureDetector(
            onTap: () {
              context.bloc<BuyBloc>().heyWaiter();
              // MyBlurPage2.pop(context); // Не нужно здесь это делать
            },
            child: Container(
              width: 220,
              height: 40,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 84, 148, 121),
                  borderRadius: BorderRadius.all(Radius.circular(35))),
              child: Center(
                child: Text(
                  'Вызвать официанта',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.25,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              MyBlurPage2.pop(context); // Опционально
            },
            child: Container(
              width: 220,
              height: 40,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 148, 84, 84),
                  borderRadius: BorderRadius.all(Radius.circular(35))),
              child: Center(
                child: Text(
                  'Показать меню',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.25,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
        ],
      ),
    ],
  );
}
