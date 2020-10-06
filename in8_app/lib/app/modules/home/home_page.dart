import 'package:flutter/material.dart';
import 'package:in8_app/app/modules/home/home_controller.dart';
import 'package:in8_app/app/modules/home/home_module.dart';
import 'package:in8_app/app/modules/home/pages/convert/convert_module.dart';
import 'package:in8_app/app/modules/home/pages/historic/historic_module.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = HomeModule.to.getBloc<HomeController>();

  List<Widget> pages;
  int selectedPage;

  @override
  void initState() {
    super.initState();
    selectedPage = 0;
    pages = [
      ConvertModule(),
      HistoricModule(),
    ];
  }

  @override
  void dispose() {
    super.dispose();
    controller.pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ContainerResponsive(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: PageView(
            controller: controller.pageController,
            children: pages,
          ),
        ),
      ),
    );
  }
}
