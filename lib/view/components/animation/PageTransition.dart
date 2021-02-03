import 'package:flutter/material.dart';

// Описание анимации перехода между маршрутами

// ? test animation route transition
/// `name`: имя маршрута
Route createRoute(Widget page, String name, {Object arguments}) {
  return PageRouteBuilder(
    // opaque: false, // Делает новую страницу прозрачной
    transitionDuration: Duration(milliseconds: 700), // Скорость перехода
    reverseTransitionDuration: Duration(milliseconds: 700), // Скорость возврата
    settings: RouteSettings(name: name, arguments: arguments),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // 1 Анимация выдыигания снизу
      // var begin = Offset(0.0, 1.0);
      // var end = Offset.zero;
      // var curve = Curves.ease;
      // var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      // return SlideTransition(
      //   position: animation.drive(tween),
      //   child: child,
      // );

      // 2 Анимация плавного перехода
      return FadeTransition(
        opacity: animation,
        child: child,
      );

      // // 3 Анимация из центра
      // return ScaleTransition(
      //   alignment: Alignment.center,
      //   scale: animation,
      //   child: child,
      // );
    },
  );
}
