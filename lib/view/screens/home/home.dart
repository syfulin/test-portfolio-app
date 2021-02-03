import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:md3/data/repositories/buy_repository.dart';
import 'package:md3/logic/blocs/buy_bloc/bloc.dart';
import 'package:md3/logic/blocs/category_bloc/bloc.dart';
import 'package:md3/logic/blocs/profile_bloc/bloc.dart';
import 'package:md3/view/screens/home/components/left_bar.dart';
import 'package:md3/logic/blocs/menu_bloc/bloc.dart';
import 'package:md3/logic/blocs/menu_bloc/state.dart';
import 'package:md3/view/screens/home/components/pages/about.dart';
import 'package:md3/view/screens/home/components/pages/clock.dart';
import 'package:md3/view/screens/home/components/pages/menu.dart';
import 'package:md3/view/screens/home/components/pages/price.dart';
import 'package:md3/view/screens/home/components/pages/profile/user_page.dart';
import 'package:md3/view/screens/home/components/pages/terms.dart';

// ? ONLY_WEB:start
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
// ? ONLY_WEB:end

// Основной виджет страницы экрана Home
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ? ONLY_WEB:start
    // Получение параметров из URL:
    var uri = Uri.tryParse(js.context['location']['href']);
    // ? ONLY_WEB:end
    // Инициализация репозитория
    BuyRepository _buyRepository = BuyRepository(
      // ? ONLY_WEB:start
      tableId: uri != null ? uri.queryParameters['table_id'] : null,
      spotId: uri != null ? uri.queryParameters['spot_id'] : null,
      // ? ONLY_WEB:end
    );

    // Обёртка в BLoC's
    return MultiBlocProvider(
      providers: [
        BlocProvider<MenuBloc>(
          create: (BuildContext context) => MenuBloc(),
        ),
        BlocProvider<CategoryBloc>(
          create: (BuildContext context) => CategoryBloc(),
        ),
        BlocProvider<ProfileBloc>(
          create: (BuildContext context) => ProfileBloc(),
        ),
        BlocProvider<BuyBloc>(
          create: (BuildContext context) =>
              BuyBloc(_buyRepository), // В блок передаём репозиторий
        ),
      ],
      child: Scaffold(
        body: Container(
          child: Row(
            children: [
              // Меню слева
              LeftBar(),
              // Область отображения основного контента
              Expanded(
                child: Container(
                  color: Color.fromARGB(255, 17, 17, 17),
                  // SafeArea для выхода фонового контейнера за пределы
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: MainContent(),
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

// Область отображения основного контента
// В ней переключается контент (страницы) через BLoC
class MainContent extends StatefulWidget {
  @override
  _MainContentState createState() => _MainContentState();
}

class _MainContentState extends State<MainContent>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // Какой бы контент ни стал появляться в MainContent() при первом запуске
    // Пытаемся залогинить клиента на основе данных в его куки
    context.bloc<ProfileBloc>().autoLogin();
  }

  @override
  Widget build(BuildContext context) {
    // При создании этого виджета нужно начать загрузку продуктов с сервера:
    context.bloc<CategoryBloc>().fetchProducts();

    // 2 Обёртка в BlocBuilder MenuBloc
    return BlocBuilder<MenuBloc, ContentTypeState>(
      builder: (context, state) {
        // В зависимости от state показывать нужные страницы
        if (state is SetContentTypeState) {
          return getContent(state.contentType);
        } else {
          // default
          return getContent('about');
        }
      },
    );
  }
}

// Метод возвращает нужный виджет-страницу
Widget getContent(String content) {
  switch (content) {
    case 'profile':
      return UserPage();
      break;
    case 'menu':
      // return BlocProvider<CategoryBloc>(
      //   create: (BuildContext context) => CategoryBloc(),
      //   child: MainMenu(),
      // );
      return MainMenu();
      break;
    case 'terms':
      return ContentTerms();
      break;
    case 'clock':
      return contentClock();
      break;
    case 'price':
      return contentPrice();
      break;
    case 'about':
      return contentAbout();
      break;
    default:
      return contentAbout();
  }
}
