import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class AppProps {
  final ThemeMode themeMode;
  final bool authorized;
  final String session;

  AppProps(this.themeMode, this.authorized, this.session);

  factory AppProps.fromJson(Map<String, dynamic> json) {
    var theme = json['theme'] == 'dark' ? ThemeMode.dark : ThemeMode.light;
    return AppProps(theme, json['authorized'] as bool, json['session']);
  }

  Map<String, dynamic> toJson() {
    var theme = themeMode == ThemeMode.dark ? 'dark' : 'light';
    return {'theme': theme, 'authorized': authorized, 'session': session};
  }
}
