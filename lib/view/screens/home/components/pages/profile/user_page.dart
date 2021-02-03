import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:md3/logic/blocs/profile_bloc/bloc.dart';
import 'package:md3/logic/blocs/profile_bloc/state.dart';
import 'package:md3/view/screens/home/components/pages/profile/login.dart';
import 'package:md3/view/screens/home/components/pages/profile/profile.dart';
import 'package:md3/view/screens/home/components/pages/profile/progress.dart';

// Основная область, в которой переключаются страницы:
// 1. Страница входа
// 2. Индикатор загрузки
// 3. Страницы профиля
class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is LogoutedState) {
          return contentLogin();
        }

        if (state is LoginState) {
          return contentProgress();
        }

        if (state is LogoutState) {
          return contentProgress();
        }

        if (state is LoginedState) {
          return Profile(state.user);
        }

        if (state is ErrorLoginState) {
          return contentLogin();
        }

        // По умолчанию показать страницу входа
        return contentLogin();
      },
    );
  }
}
