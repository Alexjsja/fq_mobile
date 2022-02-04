import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fq_mobile/data/repositories/secure_app_props_repo.dart';
import 'package:fq_mobile/domain/entities/app_props.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  test('App props repo save and read props', () async {
    final repo = SecureAppPropsRepo();

    repo.saveProps(
        const AppProps(ThemeMode.dark, false, 'ses', Locale('ru', '')));

    var props = await repo.loadProps();

    expect(props.themeMode, ThemeMode.dark);
    expect(props.authorized, false);
    expect(props.session, 'ses');
  });
}
