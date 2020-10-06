import 'package:flutter/material.dart';
import 'package:in8_app/app/shareds/controllers/controller_base.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase extends ControllerBase with Store {

  static const _duration = const Duration(milliseconds: 300);
  static const _curve = Curves.ease;


  _HomeBase() {}

  @observable
  PageController pageController = PageController();

  @action
  Future nextPage() async {
    await pageController.nextPage(duration: _duration, curve: _curve);
  }

  @action
  void previousPage() {
    pageController.previousPage(duration: _duration, curve: _curve);
  }
}
