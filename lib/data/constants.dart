import 'package:flutter/material.dart';
import 'package:fq_mobile/domain/entities/app_props.dart';

// TODO
abstract class Constants {
  static ThemeData lightTheme = ThemeData.light();

  static ThemeData darkTheme = ThemeData.dark();

  static const AppProps initialProps = AppProps(ThemeMode.light, false,'',Locale('en',''));

  static const List<Locale> supportedLocales = [
    Locale('en', ''),
    Locale('ru', ''),
  ];

  static const List<String> supportedCountriesNumbers = [
    'RU',
    'US'
  ];

  static const String passwordRegexp = r'^(?=.*[a-z])(?=.*?[0-9]).{8,}$';
}
