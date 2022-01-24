import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class AppProps {
  final ThemeMode themeMode;

  AppProps(this.themeMode);

  factory AppProps.fromJson(Map<String, dynamic> json) {
    return AppProps(json['theme'] == 'dark' ? ThemeMode.dark : ThemeMode.light);
  }

  Map<String, dynamic> toJson() {
    return {'theme': themeMode == ThemeMode.dark ? 'dark' : 'light'};
  }
}
