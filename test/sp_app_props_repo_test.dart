
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fq_mobile/data/repositories/sp_app_props_repo.dart';
import 'package:fq_mobile/domain/entities/app_props.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  test('App props repo save and read props', () async {
    SharedPreferences.setMockInitialValues({});
    var prefs = await SharedPreferences.getInstance();
    final repo = SharedPreferencesAppPropsRepo(prefs);

    repo.saveProps(AppProps(ThemeMode.dark));

    var props = repo.loadProps();

    expect(props.themeMode, ThemeMode.dark);
  });
}
