import 'package:fq_mobile/domain/entities/app_props.dart';

abstract class AppPropsRepo{
  Future<bool> propsSaved();

  Future<AppProps> loadProps();

  Future<void> saveProps(AppProps appProps);
}