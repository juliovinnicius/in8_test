import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:in8_app/app/modules/home/pages/convert/convert_controller.dart';
import 'package:in8_app/app/modules/home/pages/convert/convert_page.dart';

class ConvertModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
    Bloc((i) => ConvertController()),
  ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => ConvertPage();

  static Inject get to => Inject<ConvertModule>.of();
}
