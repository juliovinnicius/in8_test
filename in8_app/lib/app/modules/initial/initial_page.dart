import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in8_app/app/shareds/helpers/color_helper.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 4)).then((_) async {
      Navigator.pushNamed(context, '/signin');
    });
  }

  @override
  Widget build(BuildContext context) {
    // NOTE config inicial de responsividade
    ResponsiveWidgets().init(context, referenceShortestSide: 411);

    return Scaffold(
      backgroundColor: ColorLib.colorPrimary.color,
      body: Center(
        child: Image.asset(
          "assets/images/icons8-calculator-64.png",
          width: 240,
          color: ColorLib.white.color,
        ),
      ),
    );
  }
}
