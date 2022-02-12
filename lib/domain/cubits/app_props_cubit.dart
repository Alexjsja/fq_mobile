import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fq_mobile/data/constants.dart';
import 'package:fq_mobile/data/repositories/app_props_repo.dart';
import 'package:fq_mobile/domain/entities/app_props.dart';
import 'package:fq_mobile/domain/states/app_props_state.dart';

class AppPropsCubit extends Cubit<AppPropsState> {
  AppPropsCubit(this.repo) : super(LoadedState(InitialState().appProps));

  final AppPropsRepo repo;
  late AppProps _current;

  Future<void> getProps() async {
    emit(LoadingState());
    try {
      if (await repo.propsSaved()) {
        _current = await repo.loadProps();
        emit(LoadedState(_current));
      } else {
        _current = Constants.initialProps;
        emit(LoadedState(_current));
      }
    } catch (e) {
      if (kDebugMode) print('Failed load props = $e');
      emit(ErrorState());
    }
  }

  Future<void> switchTheme(bool darkTheme) async {
    var mode = darkTheme ? ThemeMode.dark : ThemeMode.light;
    if (mode == _current.themeMode) return;
    await saveProps(
        AppProps(mode, _current.authorized, _current.jwt, _current.locale));
  }

  Future<void> authorize() async {
    await saveProps(
        AppProps(_current.themeMode, true, _current.jwt, _current.locale));
  }

  Future<void> logout() async{
    await saveProps(
        AppProps(_current.themeMode, false, _current.jwt, _current.locale));
  }

  Future<void> changeLanguage(String langCode) async {
    var locale = Locale(langCode, '');
    if (locale == _current.locale) return;
    if (!Constants.supportedLocales.contains(locale)) {
      emit(ErrorState());
    } else {
      await saveProps(AppProps(
          _current.themeMode, _current.authorized, _current.jwt, locale));
    }
  }

  Future<void> saveProps(AppProps props) async {
    try {
      await repo.saveProps(props);
      emit(LoadedState(props));
      _current = props;
    } catch (e) {
      if (kDebugMode) print('Failed save props = $e');
      emit(ErrorState());
    }
  }
}
