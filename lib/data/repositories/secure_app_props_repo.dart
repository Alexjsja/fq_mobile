import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fq_mobile/data/repositories/app_props_repo.dart';
import 'package:fq_mobile/domain/entities/app_props.dart';

class SecureAppPropsRepo extends AppPropsRepo {
  final FlutterSecureStorage storage;

  SecureAppPropsRepo()
      : storage = const FlutterSecureStorage(
            aOptions: AndroidOptions(encryptedSharedPreferences: true));

  @override
  Future<AppProps> loadProps() async {
    var propsStr = await storage.read(key: 'props');
    final map = jsonDecode(propsStr!);
    return AppProps.fromJson(map);
  }

  @override
  Future<void> saveProps(AppProps appProps) async {
    await storage.write(key: 'props', value: jsonEncode(appProps.toJson()));
  }

  @override
  Future<bool> propsSaved() async{
    return storage.containsKey(key: 'props');
  }
}
