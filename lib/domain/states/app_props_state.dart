import 'package:equatable/equatable.dart';
import 'package:fq_mobile/data/constants.dart';
import 'package:fq_mobile/domain/entities/app_props.dart';

abstract class AppPropsState extends Equatable{}

class InitialState extends AppPropsState{
  final appProps = Constants.initialProps;

  @override
  List<Object?> get props => [appProps];
}

class LoadingState extends AppPropsState{
  @override
  List<Object?> get props => [];
}

class LoadedState extends AppPropsState{
  final AppProps appProps;

  LoadedState(this.appProps);

  @override
  List<Object?> get props => [appProps];
}

class ErrorState extends AppPropsState{
  @override
  List<Object?> get props => [];
}