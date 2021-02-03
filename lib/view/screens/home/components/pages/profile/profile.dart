import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:md3/logic/blocs/profile_bloc/bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatefulWidget {
  final Map<String, dynamic> user;
  const Profile(this.user, {Key key}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState(user);
}

class _ProfileState extends State<Profile> {
  // Данные пользователя:
  final Map<String, dynamic> user;

  _ProfileState(this.user);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Color.fromARGB(255, 17, 17, 17),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Иконка
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/ellipse.png',
                    width: 146 / 5,
                    height: 146 / 5,
                  ),
                  Image.asset(
                    'assets/images/sculpture.png',
                    width: 31 / 5,
                    height: 54 / 5,
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Имя
              Text(
                '${user['firstname']} ${user['lastname']}',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 22),
              // Номер телефона
              Text(
                '${user['phone']}',
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 175, 175, 189),
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 7),
              // Какие-то данные
              Text(
                'mail@mail.ru',
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 175, 175, 189),
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 22),
              // Кнопка "Редактировать"
              Container(
                width: 161,
                height: 40,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 84, 148, 121),
                    borderRadius: BorderRadius.all(Radius.circular(35))),
                child: RawMaterialButton(
                  splashColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35)),
                  onPressed: () {},
                  child: Center(
                    child: Text(
                      'Редактировать',
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
              SizedBox(height: 10),
              // test: Кнопка "Обновить данные"
              Container(
                width: 161,
                height: 40,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 148, 135, 84),
                    borderRadius: BorderRadius.all(Radius.circular(35))),
                child: RawMaterialButton(
                  splashColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35)),
                  onPressed: () {
                    // Обновить данные на странице
                    context.bloc<ProfileBloc>().autoLogin();
                  },
                  child: Center(
                    child: Text(
                      'Обновить данные',
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
              SizedBox(height: 10),
              // Кнопка "Выйти"
              Container(
                width: 161,
                height: 40,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 148, 84, 84),
                    borderRadius: BorderRadius.all(Radius.circular(35))),
                child: RawMaterialButton(
                  splashColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35)),
                  onPressed: () {
                    // Выйти из профиля
                    context.bloc<ProfileBloc>().logout();
                  },
                  child: Center(
                    child: Text(
                      'Выйти',
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
              SizedBox(height: 50),
              // Бонусная карта
              Container(
                width: 259,
                height: 156,
                child: FlipCard(
                  speed: 250,
                  front: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 23, 23, 23),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: Offset(0, 7), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          width: 68,
                          height: 73,
                        ),
                        SizedBox(
                          width: 35,
                        ),
                        Stack(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '₽ ${double.parse(user['bonus']) / 100}', // test
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.5,
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(-15, 50),
                              child: Text(
                                'CASH BACK',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 175, 175, 189),
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  back: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: Offset(0, 7), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: QrImage(
                        data: '${user['card_number']}', // test
                        version: QrVersions.auto,
                        size: 156,
                        gapless: false,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Страница "Профиль"
Widget contentProfile({Map<String, dynamic> user}) {}
