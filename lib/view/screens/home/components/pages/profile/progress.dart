import 'package:flutter/material.dart';

// Страница показа прогресса входа в профиль
Widget contentProgress() {
  return Container(
    height: double.infinity,
    color: Color.fromARGB(255, 17, 17, 17),
    child: Center(
      child: SizedBox(
        height: 70.0,
        width: 70.0,
        child: CircularProgressIndicator(
          valueColor:
              AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 84, 148, 121)),
        ),
      ),
    ),
  );
}
