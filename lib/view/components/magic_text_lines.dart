import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:async';

// ! Сделать вывод не побуквенно, а построчно
// Кастомный настраиваемый виджет для красивого появления текста
class MagicTextLines extends StatefulWidget {
  /// Строка с текстом
  ///
  /// Должна начинаться и заканчиваться на '\n' (баг?)
  final String sourceString;

  /// Стиль текста
  final TextStyle textStyle;

  /// Задержка между появлениями букв в милисекундах
  final int dur;

  const MagicTextLines({
    Key key,
    this.sourceString,
    this.textStyle,
    this.dur = 10,
  }) : super(key: key);
  @override
  _MagicTextState createState() => _MagicTextState(
        sourceString: sourceString,
        textStyle2: textStyle,
        dur: dur,
      );
}

class _MagicTextState extends State<MagicTextLines> {
  final String sourceString;
  // Исходный стиль текста
  TextStyle textStyle1;
  // Стиль текста как исходный, но прозрачного цвета
  TextStyle textStyle2;

  _MagicTextState({
    this.sourceString,
    this.textStyle2,
    this.dur = 10,
  });

  List<TextSpan> spans1 = <TextSpan>[];
  List<TextSpan> spans2 = <TextSpan>[];
  List<TextSpan> spans3 = <TextSpan>[];

  // Параметры анимации:
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

    List<String> lines = sourceString.split('\n');
    List<String> linesNew = <String>[];
    lines.forEach((element) {
      if (element == '') {
        // Пропускаем переводы строк и приписываем их к предыдущим значениям
        // (для равномерной анимации)
        linesNew.last = linesNew.last + '\n';
      } else {
        linesNew.add(element + '\n');
      }
    });

    for (int i = 0; i < linesNew.length; i++) {
      spans1.add(
        TextSpan(
          text: linesNew[i],
          style: textStyle1,
        ),
      );
      spans2.add(
        TextSpan(
          text: linesNew[i],
          style: textStyle1,
        ),
      );
      spans3.add(
        TextSpan(
          text: linesNew[i],
          style: textStyle2,
        ),
      );
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (int i = 0; i < linesNew.length; i++) {
        Future.delayed(Duration(milliseconds: dur * i), () {
          setState(() {
            spans2 = [...spans1];
            spans2.replaceRange(i, i + 1, [spans3[i]]);
            spans1 = [...spans2];
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: spans1,
      ),
    );
  }
}
