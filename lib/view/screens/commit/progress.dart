import 'package:flutter/material.dart';

// Страница показа прогресса входа в профиль
Widget indicator() {
  return SizedBox(
    height: 35.0,
    width: 35.0,
    child: CircularProgressIndicator(
      valueColor:
          AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 84, 148, 121)),
    ),
  );
}
