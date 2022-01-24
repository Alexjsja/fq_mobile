import 'dart:convert';

import 'package:fq_mobile/data/repositories/app_props_repo.dart';
import 'package:fq_mobile/domain/entities/app_props.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesAppPropsRepo extends AppPropsRepo {
  final SharedPreferences preferences;

  SharedPreferencesAppPropsRepo(this.preferences);

  @override
  AppProps loadProps() {
    final map = jsonDecode(preferences.getString('props')!);
    return AppProps.fromJson(map);
  }

  @override
  void saveProps(AppProps appProps) {
    preferences.setString('props', jsonEncode(appProps.toJson()));
  }

  @override
  bool propsSaved() {
    return preferences.containsKey('props');
  }
}
