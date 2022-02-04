import 'package:flutter/material.dart';

class AppProps {
  final ThemeMode themeMode;
  final bool authorized;
  final String session;
  final Locale locale;

  const AppProps(this.themeMode, this.authorized, this.session, this.locale);

  factory AppProps.fromJson(Map<String, dynamic> json) {
    var theme = json['theme'] == 'dark' ? ThemeMode.dark : ThemeMode.light;
    return AppProps(theme, json['authorized'] as bool, json['session'],
        Locale(json['locale'], ''));
  }

  Map<String, dynamic> toJson() {
    var theme = themeMode == ThemeMode.dark ? 'dark' : 'light';
    return {
      'theme': theme,
      'authorized': authorized,
      'session': session,
      'locale': locale.languageCode
    };
  }
}
