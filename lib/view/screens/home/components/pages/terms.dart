import 'package:flutter/material.dart';
import 'package:md3/view/components/magic_text.dart';
import 'package:md3/view/components/magic_text_lines.dart';

// Страница "Правила"
class ContentTerms extends StatefulWidget {
  @override
  _ContentTermsState createState() => _ContentTermsState();
}

class _ContentTermsState extends State<ContentTerms> {
  // Индеес начального текстового ресурса
  int curentIndex = 0;

  String title = '''
ПРАВИЛА
''';
  // Текстовые ресурсы:
  List<String> terms = [
// 1
    ''' 
Бронь столика длится 2 часа,
но, если за вами нет брони,
то вы можете продлить
посещение, заказав новый
кальян

МАКСИМАЛЬНАЯ ПОСАДКА:
За один стол - до 6 человек
VIP-комната - до 25 человек
Зимний сад - до 12 человек

Депозит VIP-комнаты на 2
часа - 5000р
(в эту сумму входит
стоимость кальянов,
продукция из нашего меню),
бронируется минимум за
сутки,  в случае снятия брони
за час указанного времени,
депозит не возвращается''',
// 2
    '''
Стоимость:

СЧАСТЛИВЫЕ ЧАСЫ
каждый день
С 12 до 16 - кальян 800₽

1-4 человек - 1 кальян -1100₽
5-8 человек - 2 кальяна - 1800₽
9-12 человек - 3 кальяна - 2700₽
13-16человек - 4 кальяна - 3400₽''',
//3
    '''
С СОБОЙ МОЖНО ПРИНЕСТИ
ЕДУ!

Из алкогольных напитков
разрешается:

- вино/игристое (кроме пива и
сидра)
ПРОБКОВЫЙ СБОР С
БУТЫЛКИ - 150₽

- крепкий алкоголь (кроме
водки)
ПРОБКОВЫЙ СБОР С
БУТЫЛКИ - 250₽

БЕЗАЛКОГОЛЬНЫЕ НАПИТКИ
НЕЛЬЗЯ, ТАК КАК ОНИ ЕСТЬ В
НАШЕМ МЕНЮ!''',
// 4
    '''
ЗАПРЕЩЕНО:

- курить сигареты, сигары,
вейпы, IQOS и др.

- передвигать мебель,
совмещать столы,
самостоятельно двигать
кальяны''',
// 5
    '''
ВХОД СТРОГО 18+

На входе могут спросить
оригинал документы,
подтверждающего вашу
личность (паспорт, ВУ)

Мы вправк отказать в
посещении лицам,
находящимся в алкогольном/
наркотическом опьянении

Мы просим уважительно
относиться к отдыху
окружающих и вести себя
прилично

ДОБРО ПОЖАЛОВАТЬ В
SHAPE LOUNGE!''',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Color.fromARGB(255, 17, 17, 17),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MagicText(
                sourceString: title,
                interval: 8,
                dur: 100,
                textStyle: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              // SizedBox(height: 25),
              MagicTextLines(
                key: UniqueKey(),
                sourceString: terms[curentIndex],
                dur: 50,
                textStyle: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  // fontSize: 25,
                  color: Colors.white,
                ),
              ),
              // SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Кнопка "Prev"
                  (curentIndex > 0)
                      ? Container(
                          width: 75,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(75, 255, 255, 255),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35))),
                          child: RawMaterialButton(
                            splashColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35)),
                            onPressed: () {
                              // onPressed
                              if (curentIndex > 0) {
                                setState(() {
                                  curentIndex--;
                                });
                              }
                            },
                            child: Center(
                              child: Text(
                                '←',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.25,
                                ),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(width: 75),
                  SizedBox(width: 10),
                  Text(
                    '${curentIndex + 1}/${terms.length}',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Courier New',
                    ),
                  ),
                  SizedBox(width: 10),
                  // Кнопка "Next"
                  (curentIndex < terms.length - 1)
                      ? Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(75, 255, 255, 255),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35))),
                          child: RawMaterialButton(
                            splashColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35)),
                            onPressed: () {
                              // onPressed
                              if (curentIndex < terms.length - 1) {
                                setState(() {
                                  curentIndex++;
                                });
                              }
                            },
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Ok',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.25,
                                    ),
                                  ),
                                  Text(
                                    ' →',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : SizedBox(width: 100),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
