import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:md3/logic/blocs/profile_bloc/bloc.dart';
import 'package:md3/logic/blocs/profile_bloc/state.dart';

// Страница "Вход"
Widget contentLogin() {
  return Container(
    height: double.infinity,
    color: Color.fromARGB(255, 17, 17, 17),
    child: Center(
      child: SingleChildScrollView(
        child: LoginForm(),
      ),
    ),
  );
}

// Форма входа
class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // Номер телефона
  String phoneNumber = '';
  // Контроллер ввода номера телефона
  final myController = TextEditingController();

  // Фокус поля ввода номера
  FocusNode myFocusNode;

  // Формат ввода номера телефона:
  var maskFormatter = new MaskTextInputFormatter(
    mask: '+# (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myController.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  // Проверка номера телефона
  void checkPhoneNumber() {
    phoneNumber = myController.text;
    // print('changed:' + phoneNumber);
    // Здесь проверяем номер телефона на корректный формат
  }

  void logIn(BuildContext context) {
    // Отправляем данные в блок:
    context.bloc<ProfileBloc>().login(phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Поле ввода номера
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            width: 270,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 32, 32, 32),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            padding: EdgeInsets.all(5),
            child: TextField(
              inputFormatters: [maskFormatter], // Формат ввода
              autofocus: true,
              focusNode: myFocusNode,
              controller: myController,
              onSubmitted: (_) {
                logIn(context);
              },
              onChanged: (str) {
                checkPhoneNumber();
              },
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
              ),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white38),
                hintText: 'Введите номер телефона',
              ),
            ),
          ),
        ),
        BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ErrorLoginState) {
              return Text(
                '${state.errorInfo}',
                style: TextStyle(color: Colors.red, fontSize: 15),
              );
            }
            return Container();
          },
        ),
        SizedBox(height: 20),
        // Кнопка "Войти"
        GestureDetector(
          onTap: () {
            myFocusNode.unfocus(); // Убрать фокус с поля
            logIn(context); // test
          },
          child: Container(
            width: 161,
            height: 40,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 84, 148, 121),
                borderRadius: BorderRadius.all(Radius.circular(35))),
            child: Center(
              child: Text(
                'Войти',
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
    );
  }
}
