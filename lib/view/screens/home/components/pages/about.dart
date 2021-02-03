import 'package:flutter/material.dart';
import 'package:md3/view/components/magic_text.dart';
import 'package:md3/view/components/magic_text_lines.dart';

// Страница "О нас"
Widget contentAbout() {
  return Container(
    height: double.infinity,
    color: Color.fromARGB(255, 17, 17, 17),
    child: Column(
      children: [
        Expanded(
          flex: 3,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                child: FadeInImage(
                  fadeInDuration: Duration(milliseconds: 250),
                  image: AssetImage(
                    'assets/images/cover.png', // Логотип
                  ),
                  placeholder: AssetImage(
                    'assets/images/logo_zaglushka.png', // Прозрачная заглушка
                  ),
                  // alignment: Alignment.c,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.0, 1.0),
                    end: Alignment(0.0, 0.6),
                    colors: [
                      const Color.fromARGB(255, 17, 17, 17),
                      const Color.fromARGB(150, 17, 17, 17),
                      const Color.fromARGB(50, 17, 17, 17),
                      const Color.fromARGB(0, 17, 17, 17)
                    ], // red to yellow
                  ),
                ),
              ),
            ],
          ),
        ),
        // Expanded(
        //   // flex: 4,
        //   child:
        Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Уважаемые гости',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    fontSize: 16, // 14
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  constraints: BoxConstraints(minHeight: 200, maxWidth: 800),
                  child: Text(
                    'Мы глубоко ценим каждого из вас и рады приветствовать в электронном меню MD hookah. Для пользователей данного ресурса, появляется возможность ознакомиться с меню нашего заведения, сделать мгновенный заказ и просто пригласить кальянщика или администратора к вашему столу. Получать кешбэк с каждой покупки и тратить его на любые позиции меню.',
                    style: TextStyle(
                      color: Color.fromARGB(127, 255, 255, 255),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 10, // 9
                      height: 1.8,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // ),
        SizedBox(height: 20),
      ],
    ),
  );
}
