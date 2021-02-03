import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/scheduler.dart';
import 'package:md3/logic/blocs/buy_bloc/bloc.dart';
import 'package:md3/logic/blocs/profile_bloc/bloc.dart';
import 'package:md3/logic/blocs/profile_bloc/state.dart';
import 'package:md3/logic/blocs/menu_bloc/bloc.dart';
import 'package:md3/logic/blocs/menu_bloc/state.dart';
import 'package:md3/view/components/animation/my_blur_page2.dart';
import 'package:md3/view/screens/commit/commit_alert.dart';

// ? ONLY_WEB:start
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
// ? ONLY_WEB:end

class LeftBar extends StatefulWidget {
  @override
  _LeftBarState createState() => _LeftBarState();
}

class _LeftBarState extends State<LeftBar> with TickerProviderStateMixin {
  // Сразу после загрузки LeftBar предлагаем вызвать официанта
  // (Если в url есть параметр table_id)
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 0), () {
        // ? ONLY_WEB:start
        // test:
        if (Uri.tryParse(js.context['location']['href'])
                .queryParameters['table_id'] !=
            null) {
          // Подготовить данные для заказа
          context.bloc<BuyBloc>().prepairData(heyWaiter: true, init: true);
          // Показать всплывающее окно
          Navigator.push(
            context,
            createBlurRouteWithBlurBackground2(
              CommitAlert(),
              '/commit',
              context: context,
            ),
          );
        }
        // ? ONLY_WEB:end
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 120,
      // color: Colors.red, // ???
      child: Stack(
        children: [
          Container(
            width: 87, //91
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 32, 32, 32), // original: 17 17 17
            ),
            // SafeArea для выхода фонового контейнера за пределы
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Верхний флекс
                  Column(
                    children: [
                      // Лого
                      Padding(
                        padding: const EdgeInsets.only(top: 20), // 63
                        child: Container(
                          width: 68,
                          alignment: Alignment.centerLeft,
                          child: FadeInImage(
                            width: 68,
                            height: 73,
                            fadeInDuration: Duration(milliseconds: 300),
                            image: AssetImage(
                              'assets/images/logo.png', // Логотип
                            ),
                            placeholder: AssetImage(
                              'assets/images/logo_zaglushka.png', // Прозрачная заглушка
                            ),
                          ),
                        ),
                      ),
                      // Отступ
                      SizedBox(height: 25), // 55
                      // Данные клиента
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 6),
                        child: GestureDetector(
                          onTap: () {
                            // Открываем профиль
                            context.bloc<MenuBloc>().setContent('profile');
                            // Обновляем данные
                            context.bloc<ProfileBloc>().autoLogin();
                          },
                          child: Container(
                            width:
                                double.infinity, // ? что бы попасть пальцем ?
                            color: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Иконка
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/ellipse.png',
                                      width: 60,
                                      height: 60,
                                    ),
                                    Image.asset(
                                      'assets/images/sculpture.png',
                                      width: 14,
                                      height: 25,
                                    ),
                                  ],
                                ),
                                // Отступ
                                SizedBox(height: 13),
                                BlocBuilder<ProfileBloc, ProfileState>(
                                  builder: (context, state) {
                                    if (state is LoginedState) {
                                      // Если залогинен
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Бонусы',
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 175, 175, 189),
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              // Отступ
                                              SizedBox(
                                                width: 2,
                                              ),
                                              // Кнопка
                                              Image.asset(
                                                'assets/images/polygon.png',
                                                width: 9,
                                                height: 6,
                                              ),
                                            ],
                                          ),
                                          // Отступ
                                          SizedBox(height: 7),
                                          // Баланс
                                          Text(
                                            '₽${double.parse(state.user['bonus']) / 100}',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      );
                                    }
                                    if (state is LoginState ||
                                        state is LogoutState) {
                                      return SizedBox(
                                        height: 20.0,
                                        width: 20.0,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2.0,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Color.fromARGB(
                                                      255, 84, 148, 121)),
                                        ),
                                      );
                                    }
                                    if (state is LoginedState ||
                                        state is ErrorLoginState) {
                                      return Text(
                                        'Войти',
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 175, 175, 189),
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17,
                                        ),
                                      );
                                    }
                                    // Если не залогинен (по умолчанию)
                                    return Text(
                                      'Войти',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 175, 175, 189),
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),

                  // Нижний флекс
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Список элементов меню
                      BlocBuilder<MenuBloc, ContentTypeState>(
                        builder: (context, state) {
                          if (state is SetContentTypeState) {
                            if (state.contentType == 'profile') {
                              return CustomMenu(
                                initItem: 'profile',
                                key: Key('profile'),
                              );
                            } else {
                              return CustomMenu(
                                initItem: state.contentType,
                                key: Key('no_profile'),
                              );
                            }
                          }
                          // default
                          return CustomMenu(
                              initItem: 'menu', key: Key('no_profile'));
                        },
                      ),

                      // Отступ
                      SizedBox(height: 10), // 95
                      // Колокольцев
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30), // 58
                        child: GestureDetector(
                          onTap: () {
                            // Подготовить данные для заказа
                            context
                                .bloc<BuyBloc>()
                                .prepairData(heyWaiter: true);
                            // Показать всплывающее окно
                            Navigator.push(
                              context,
                              createBlurRouteWithBlurBackground2(
                                CommitAlert(),
                                '/commit',
                                context: context,
                              ),
                            );
                          },
                          child: Container(
                            color: Colors.transparent,
                            width: 29,
                            height: 47,
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/images/kolokolcev.png', // Логотип
                              // ! Из за этой вещи не отображаются некоторые страницы (Android):
                              // filterQuality: FilterQuality.high,
                              width: 29,
                              height: 27,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomMenu extends StatefulWidget {
  final String initItem;

  const CustomMenu({Key key, this.initItem}) : super(key: key);
  @override
  _CustomMenuState createState() => _CustomMenuState(initItem: initItem);
}

class _CustomMenuState extends State<CustomMenu> with TickerProviderStateMixin {
  // Индекс выбранного элемента при инициализации
  final String initItem;
  _CustomMenuState({this.initItem});

  List<Map<String, String>> _list = [
    {'name': 'menu', 'value': 'Меню'},
    {'name': 'terms', 'value': 'Правила'},
    {'name': 'clock', 'value': 'Часы\nработы'},
    {'name': 'price', 'value': 'Цены'},
    {'name': 'about', 'value': 'О нас'},
  ];

  List<GlobalKey> _keys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  int checkIndex;

  // Данные о смещении курсора:
  Offset checkedPositionOffset = Offset(0, 0);
  Offset lastCheckOffset = Offset(0, 0);

  Offset animationOffset = Offset(0, 0);

  // Анимация курсора:
  Animation _animation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    // Инициализация индекса элемента меню при запуске
    checkIndex = _list.indexWhere((item) => item['name'] == initItem) ?? 0;

    // Инициализация первого элемента в меню
    // Как-то не однозначно, но работает
    if (checkIndex == -1) {
      checkIndex = _list.length;
    } else {
      // 3 Вызов MenuBloc setContent(...)
      context.bloc<MenuBloc>().setContent(_list[checkIndex]['name']);
      // Какой-то слушатель ?
      SchedulerBinding.instance.endOfFrame.then((value) {
        calculateCheckOffset();
        addAnimation();
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void addAnimation() {
    _animationController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this)
          ..addListener(() {
            setState(() {
              animationOffset =
                  Offset(checkedPositionOffset.dx, _animation.value);
            });
          });

    _animation = Tween(begin: lastCheckOffset.dy, end: checkedPositionOffset.dy)
        .animate(
            CurvedAnimation(parent: _animationController, curve: Curves.ease));

    _animationController.forward();
  }

  void calculateCheckOffset() {
    lastCheckOffset = checkedPositionOffset;
    // находит расположение объектв-элемент_списка_меню
    RenderBox renderBox = _keys[checkIndex].currentContext.findRenderObject();
    Offset widgetOffset = renderBox.localToGlobal(Offset(0, 0));

    // находит расположение текущего объекта
    RenderBox rb = this.context.findRenderObject();
    Offset wO = rb.localToGlobal(Offset(0, 0));

    Size widgetSize = renderBox.size;
    checkedPositionOffset = Offset(
      widgetOffset.dx + widgetSize.width - wO.dx,
      widgetOffset.dy + widgetSize.height - wO.dy,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15), // 17
          child: Container(
            // color: Colors.white24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildList(),
            ),
          ),
        ),
        Positioned(
          top: animationOffset.dy,
          left: animationOffset.dx,
          child: CustomPaint(
            // Offset, как минус половина высоты элемента меню
            painter: CheckPointPainter(Offset(0, -18)),
          ),
        ),
      ],
    );
  }

  // Строитель списка элементов меню
  List<Widget> _buildList() {
    List<Widget> _widget_list = [];

    for (int i = 0; i < _list.length; i++) {
      _widget_list.add(
        GestureDetector(
          onTap: () {
            indexChecked(i);
            // 3 Вызов MenuBloc setContent(...)
            context.bloc<MenuBloc>().setContent(_list[i]['name']);
          },
          child: CustomText(
              _list[i]['value'],
              _keys[i],
              checkIndex == i &&
                  (_animationController !=
                      null /*&&
                      _animationController.isCompleted*/
                  )),
        ),
      );
    }

    return _widget_list;
  }

  void indexChecked(int i) {
    if (checkIndex == i) return;

    setState(() {
      checkIndex = i;
      calculateCheckOffset();
      addAnimation();
    });
  }
}

// Рисование курсора
class CheckPointPainter extends CustomPainter {
  double pointRadius = 5;
  double radius = 30;

  Offset offset;
  CheckPointPainter(this.offset);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.green;

    paint.color = Color.fromARGB(255, 17, 17, 17);
    paint.style = PaintingStyle.fill;
    var path = Path();
    path.moveTo(offset.dx, offset.dy);
    path.lineTo(offset.dx, offset.dy - 18);
    path.lineTo(offset.dx - 10, offset.dy);
    path.lineTo(offset.dx, offset.dy + 18);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// Элемент списка меню
class CustomText extends StatelessWidget {
  final String value;
  final bool checked;
  final GlobalKey globalKey;

  CustomText(this.value, this.globalKey, this.checked);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: globalKey,
      color: Colors.transparent,
      alignment: Alignment.centerLeft,
      height: 36,
      child: Text(
        value,
        style: TextStyle(
          color: checked
              ? Color.fromARGB(255, 255, 255, 255)
              : Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
          fontSize: checked ? 13 : 11,
        ),
      ),
    );
  }
}
