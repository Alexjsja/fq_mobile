import 'package:flutter/material.dart';

class AppProps {
  final ThemeMode themeMode;
  final bool authorized;
  final String jwt;
  final Locale locale;

  const AppProps(this.themeMode, this.authorized, this.jwt, this.locale);

  const AppProps.named(
      {required this.themeMode,
      required this.authorized,
      required this.jwt,
      required this.locale});

  // TODO: 04.02.2022 think how better
  factory AppProps.fromJson(Map<String, dynamic> json) {
    var theme =
        (json['theme'] ?? 'light') == 'dark' ? ThemeMode.dark : ThemeMode.light;
    return AppProps.named(
        themeMode: theme,
        authorized: json['authorized'] ?? false,
        jwt: json['jwt'] ?? '',
        locale: Locale(json['locale'] ?? 'en', ''));
  }

  Map<String, dynamic> toJson() {
    var theme = themeMode == ThemeMode.dark ? 'dark' : 'light';
    return {
      'theme': theme,
      'authorized': authorized,
      'jwt': jwt,
      'locale': locale.languageCode
    };
  }
}
