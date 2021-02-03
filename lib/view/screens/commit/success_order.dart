import 'package:flutter/material.dart';
import 'package:md3/view/components/animation/my_blur_page2.dart';

Widget successOrder(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    mainAxisSize: MainAxisSize.min,
    children: [
      // Информационный текст
      Text(
        'Заказ успешно оформлен', // три пробела между символами
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
          fontSize: 17, // 14
        ),
      ),
      Text(
        'Ожидайте официанта', // три пробела между символами
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
          fontSize: 17, // 14
        ),
      ),
      SizedBox(height: 25),
      // Кнопки действий
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              MyBlurPage2.pop(context);
            },
            child: Container(
              width: 161,
              height: 40,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 84, 148, 121),
                  borderRadius: BorderRadius.all(Radius.circular(35))),
              child: Center(
                child: Text(
                  'Ок',
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
        ],
      ),
    ],
  );
}
