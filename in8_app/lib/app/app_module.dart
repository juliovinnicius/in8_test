import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:in8_app/app/app_widget.dart';
import 'package:in8_app/app/shareds/helpers/form_helper.dart';

class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [];

  @override
  List<Dependency> get dependencies => [
    Dependency((i) => FormHelper(), singleton: false),
  ];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
