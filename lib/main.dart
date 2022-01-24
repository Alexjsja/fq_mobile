import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'internal/application.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs0 = await SharedPreferences.getInstance();
  runApp(Application(prefs: prefs0));
}