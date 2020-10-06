import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:in8_app/app/modules/initial/signin/signin_page.dart';

class SigninModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => SigninPage();

  static Inject get to => Inject<SigninModule>.of();
}