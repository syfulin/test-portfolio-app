import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:md3/logic/blocs/menu_bloc/state.dart';

class MenuBloc extends Cubit<ContentTypeState> {
  // Инициализация
  MenuBloc(/*Репозиторий*/) : super(SetContentTypeState('menu'));

  Future<void> setContent(String value) async {
    if (value == 'profile') {
      emit(SetContentTypeState('profile'));
      return;
    }
    if (value == 'menu') {
      emit(SetContentTypeState('menu'));
      return;
    }
    if (value == 'terms') {
      emit(SetContentTypeState('terms'));
      return;
    }
    if (value == 'clock') {
      emit(SetContentTypeState('clock'));
      return;
    }
    if (value == 'price') {
      emit(SetContentTypeState('price'));
      return;
    }
    if (value == 'about') {
      emit(SetContentTypeState('about'));
      return;
    }
    if (value == 'null') {
      emit(SetContentTypeState('null'));
      return;
    }

    // default
    return SetContentTypeState('about');
  }
}
