import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'package:in8_app/app/modules/home/pages/historic/historic_controller.dart';
import 'package:in8_app/app/modules/home/pages/historic/historic_page.dart';

class HistoricModule extends ModuleWidget {

  List<double> oldvalue;
  List<double> newvalue;

  HistoricModule({this.oldvalue, this.newvalue});

  @override
  List<Bloc> get blocs => [
    Bloc((i) => HistoricController(old: oldvalue, value: newvalue)),
  ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => HistoricPage();

  static Inject get to => Inject<HistoricModule>.of();
}
