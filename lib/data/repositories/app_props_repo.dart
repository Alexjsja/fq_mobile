import 'package:fq_mobile/domain/entities/app_props.dart';

abstract class AppPropsRepo{
  bool propsSaved();

  AppProps loadProps();

  void saveProps(AppProps appProps);
}