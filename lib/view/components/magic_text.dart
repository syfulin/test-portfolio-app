import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:async';

// ! Сделать вывод не побуквенно, а построчно
// Кастомный настраиваемый виджет для красивого появления текста
class MagicText extends StatefulWidget {
  /// Строка с текстом
  ///
  /// Должна начинаться и заканчиваться на '\n' (баг?)
  final String sourceString;

  /// Стиль текста
  final TextStyle textStyle;

  /// Интервал перемешивания символов
  /// (символы не уйдут за пределы своего интервала)
  /// Желательно должен быть кратен кол-ву символов ???
  final int interval;

  /// Задержка между появлениями букв в милисекундах
  final int dur;

  const MagicText({
    Key key,
    this.sourceString,
    this.textStyle,
    this.interval = 22,
    this.dur = 10,
  }) : super(key: key);
  @override
  _MagicTextState createState() => _MagicTextState(
        sourceString: sourceString,
        textStyle2: textStyle,
        interval: interval,
        dur: dur,
      );
}

class _MagicTextState extends State<MagicText> {
  final String sourceString;
  // Исходный стиль текста
  TextStyle textStyle1;
  // Стиль текста как исходный, но прозрачного цвета
  TextStyle textStyle2;

  _MagicTextState({
    this.sourceString,
    this.textStyle2,
    this.interval = 22,
    this.dur = 10,
  });

  List<TextSpan> spans1 = <TextSpan>[];
  List<TextSpan> spans2 = <TextSpan>[];
  List<TextSpan> spans3 = <TextSpan>[];

  // Массив индексов букв, который надо заполнить и перемешать:
  List<int> indexes;
  // Строка, в которую будет записан текст
  String bolvanka = ''; // Инициализация обязательна

  // Параметры анимации:
  // 1. Интервал перемешивания символов
  // (символы не уйдут за пределы своего интервала)
  // Желательно должен быть кратен кол-ву символов ???
  int interval;
  // 2. Задержка между появлениями букв в милисекундах
  int dur;

  // Переопределить метод, что бы исключить ошибку:
  // Error: setState() called after dispose()...
  // Эта ошибка появляется, когда виджет удаляется, но
  // анимация еще не завершилась
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();

    // Копируем стиль текста, изменяя его цвет на прозрачный
    textStyle1 = textStyle2.copyWith(color: Colors.transparent);

    // Инициализация списка индексов + перешать его необычным способом
    indexes = List.generate(sourceString.length - 1, (i) => i);
    for (int i = 0; i < indexes.length / interval; i++) {
      try {
        indexes.replaceRange(interval * i, interval * i + interval,
            indexes.sublist(interval * i, interval * i + interval)..shuffle());
        // Перемешанные серии индексов длиной interval штук
        // print(indexes.sublist(10 * i, interval * i + interval));
      } catch (_) {
        // Здесь нужно перемешать оставшиеся индексы
        // Количество которы= равно остатку от деления на interval
        print('error???');
      }
    }

    // 1. Вариант
    for (int i = 0; i < sourceString.length; i++) {
      spans1.add(
        TextSpan(
          text: sourceString[i],
          style: textStyle1,
        ),
      );
      spans2.add(
        TextSpan(
          text: sourceString[i],
          style: textStyle1,
        ),
      );
      spans3.add(
        TextSpan(
          text: sourceString[i],
          style: textStyle2,
        ),
      );
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      List<List<TextSpan>> listSpans = [];
      for (int i = 0; i < sourceString.length - 1; i++) {
        spans2 = [...spans2]
          ..replaceRange(indexes[i], indexes[i] + 1, [spans3[indexes[i]]]);
        listSpans.add(spans2);
      }

      for (int i = 0; i < sourceString.length - 1; i++) {
        Future.delayed(Duration(milliseconds: dur * i), () {
          setState(() {
            // spans1 = listSpans[i];
            // spans1 = [...spans1]
            //   ..replaceRange(indexes[i], indexes[i] + 1, [spans3[indexes[i]]]);
          });
        });

        Timer(Duration(milliseconds: dur * i), () {
          spans1 = listSpans[i];
        });
      }
    });

    // Инициализация болванки (строки с пробелами, в которую будет записан текст)
    // Переносы строки копируются из исходного текста (что бы небыло скачков при появлении)
    // Остальные места заполняются пробелами
    // (Это нужно только для 2. варианта)
    // for (int i = 0; i < sourceString.length; i++) {
    //   if (sourceString[i] == '\n') {
    //     bolvanka += '\n';
    //   } else {
    //     bolvanka += ' ';
    //   }
    // }

    // // 2. Вариант
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   for (int i = 0; i < sourceString.length - 1; i++) {
    //     Future.delayed(Duration(milliseconds: dur * i), () {
    //       setState(() {
    //         bolvanka = bolvanka.substring(0, indexes[i]) +
    //             sourceString.substring(indexes[i], indexes[i] + 1) +
    //             bolvanka.substring(indexes[i] + 1);
    //       });
    //     });
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    // 0. Вариант
    // 1. Вариант
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: spans1,
      ),
    );
    // // 2. Вариант
    // return Text(
    //   bolvanka,
    //   style: TextStyle(
    //     fontFamily: 'Courier New',
    //     color: textStyle2.color,
    //   ),
    //   softWrap: true,
    //   textAlign: TextAlign.center,
    // );
  }
}
