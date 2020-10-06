import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in8_app/app/app_module.dart';
import 'package:in8_app/app/shareds/helpers/color_helper.dart';
import 'package:in8_app/app/shareds/helpers/form_helper.dart';
import 'package:in8_app/app/shareds/widgets/input_hover_widget.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final FormHelper form = AppModule.to.getDependency<FormHelper>();

  @override
  Widget build(BuildContext context) {
    return ContainerResponsive(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: ContainerResponsive(
              height: MediaQuery.of(context).size.height,
              heightResponsive: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  /// NOTE logo
                  ContainerResponsive(
                    margin: EdgeInsetsResponsive.symmetric(horizontal: 48.42),
                    child: Image.asset(
                      'assets/images/icons8-calculator-64.png',
                      height: 75,
                      color: ColorLib.colorPrimary.color,
                    ),
                  ),
                  ContainerResponsive(
                    padding: EdgeInsetsResponsive.only(top: 15),
                    margin: EdgeInsetsResponsive.symmetric(horizontal: 30),
                    child: Column(
                      children: <Widget>[
                        // NOTE Formularios
                        InputHoverWidget(
                          hint: 'Username or Email',
                          keyboardType: TextInputType.number,
                        ),

                        InputHoverWidget(
                          hint: 'Password',
                          obscureText: true,
                          margin: EdgeInsetsResponsive.only(top: 23),
                        ),

                        // NOTE Buttons
                        Padding(
                          padding: EdgeInsetsResponsive.only(top: 14),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () => Get.toNamed('/recover'),
                              child: TextResponsive(
                                'Esqueceu?',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        ContainerResponsive(
                          margin: EdgeInsetsResponsive.only(top: 15),
                          height: 46,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: RaisedButtonResponsive(
                            onPressed: () => Navigator.pushNamed(context, '/home'),
                            color: ColorLib.colorPrimary.color,
                            child: TextResponsive(
                              'Entrar',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
