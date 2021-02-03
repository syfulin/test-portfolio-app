import 'package:flutter/material.dart';

// Страница "Цены"
Widget contentPrice() {
  return ContentPrice();
}

class ContentPrice extends StatefulWidget {
  @override
  _ContentPriceState createState() => _ContentPriceState();
}

class _ContentPriceState extends State<ContentPrice>
    with SingleTickerProviderStateMixin {
  GlobalKey _keyCanvas1;
  GlobalKey _keyCanvas2;
  // Контроллер длины линий
  Animation<double> animationLines;
  // Контроллер анимации
  AnimationController animationController;
  @override
  void initState() {
    super.initState();
    // Идентификатор канваса
    _keyCanvas1 = GlobalKey();
    _keyCanvas2 = GlobalKey();

    // Инициализация контроллера анимации
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    // Инициализация анимации дины линий
    animationLines = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));

    // Сразу после отриовки "нашего канваса"
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Получить данные о нём
      RenderBox renderBox1 = _keyCanvas1.currentContext.findRenderObject();
      RenderBox renderBox2 = _keyCanvas2.currentContext.findRenderObject();
      // Его координаты
      Offset widgetOffset1 = renderBox1.localToGlobal(Offset(0, 0));
      Offset widgetOffset2 = renderBox2.localToGlobal(Offset(0, 0));
      // И размер
      Size widgetSize1 = renderBox1.size;
      Size widgetSize2 = renderBox2.size;
      // print(widgetOffset1);
      // print(widgetOffset2);
      // print(widgetSize1);
      // print(widgetSize2);

      // Запуск анимации
      animationController.forward();
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // height: 20,
        width: 260,
        color: Color.fromARGB(255, 17, 17, 17),
        // color: Colors.blue, // test
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // количество гостей
            textStyle('количество гостей', 12),
            SizedBox(height: 10),
            // цифры
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                textStyle(' 1-4', 15),
                textStyle('     5-8', 15),
                textStyle('    9-12', 15),
                textStyle('13-16', 15),
              ],
            ),
            SizedBox(height: 5),
            AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                return Container(
                  key: _keyCanvas1,
                  width: 250,
                  height: 100,
                  // color: Colors.grey,
                  child: Center(
                    child: Stack(
                      children: [
                        CustomPaint(
                          painter: DrawLine(
                              Offset(-100, 0 - (animationLines.value / 2)),
                              animationLines.value),
                        ),
                        CustomPaint(
                          painter: DrawLine(
                              Offset(-33.33, 0 - (animationLines.value / 2)),
                              animationLines.value),
                        ),
                        CustomPaint(
                          painter: DrawLine(
                              Offset(33.33, 0 - (animationLines.value / 2)),
                              animationLines.value),
                        ),
                        CustomPaint(
                          painter: DrawLine(
                              Offset(100, 0 - (animationLines.value / 2)),
                              animationLines.value),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            // количество кальянов
            textStyle('количество кальянов', 12),
            SizedBox(height: 10),
            // цифры
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                textStyle('1', 15),
                textStyle(' 2', 15),
                textStyle(' 3', 15),
                textStyle('4', 15),
              ],
            ),
            SizedBox(height: 5),
            AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                return Container(
                  key: _keyCanvas2,
                  width: 250,
                  height: 100,
                  // color: Colors.grey,
                  child: Center(
                    child: Stack(
                      children: [
                        CustomPaint(
                          painter: DrawLine(
                              Offset(-100, 0 - (animationLines.value / 2)),
                              animationLines.value),
                        ),
                        CustomPaint(
                          painter: DrawLine(
                              Offset(-33.33, 0 - (animationLines.value / 2)),
                              animationLines.value),
                        ),
                        CustomPaint(
                          painter: DrawLine(
                              Offset(33.33, 0 - (animationLines.value / 2)),
                              animationLines.value),
                        ),
                        CustomPaint(
                          painter: DrawLine(
                              Offset(100, 0 - (animationLines.value / 2)),
                              animationLines.value),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            // стоимость
            textStyle('стоимость', 12),
            SizedBox(height: 5),

            // цифры
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                textStyle('1100₽', 15),
                textStyle('     1800₽', 15),
                textStyle('    2700₽', 15),
                textStyle('3400₽', 15),
              ],
            ),
            SizedBox(height: 30),
            // Дополнительное описание
            textStyle('Каждый день счастливые часы -', 13),
            textStyle('с 12:00 до 16:00:', 13),
            textStyle('Кальян - 800₽', 13),
            SizedBox(height: 10),
            textStyle('Стол бронируется на 2 часа', 13),
            SizedBox(height: 10),
            textStyle('Подробности у администратора', 13),
          ],
        ),
      ),
    );
  }
}

class DrawLine extends CustomPainter {
  double length;
  Offset offset;
  DrawLine(this.offset, this.length);

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.5;
    canvas.drawLine(
      Offset(offset.dx + 0.0, offset.dy + 0.0),
      Offset(offset.dx + 0.0, offset.dy + length),
      line,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

Widget textStyle(String value, double size) {
  return Text(
    value,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      fontSize: size, // 14
    ),
  );
}
