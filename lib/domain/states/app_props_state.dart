import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fq_mobile/domain/entities/app_props.dart';

abstract class AppPropsState extends Equatable{}

class InitialState extends AppPropsState{
  final initial = AppProps(ThemeMode.light);

  @override
  List<Object?> get props => [initial];
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