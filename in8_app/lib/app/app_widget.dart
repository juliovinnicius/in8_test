import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:in8_app/app/modules/home/home_module.dart';
import 'package:in8_app/app/modules/initial/initial_page.dart';
import 'package:in8_app/app/modules/initial/signin/signin_module.dart';
import 'package:in8_app/app/shareds/helpers/color_helper.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {


  @override
  Widget build(BuildContext context) {
    // NOTE não deixa a tela virar
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'IN8 App',
      locale: Locale('pt', 'BR'),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('pt'),
      ],
      theme: _buildThemeData(ColorLib.colorPrimary.hex),
      initialRoute: '/',
      routes: {
        '/': (context) => InitialPage(),
        '/signin': (context) => SigninModule(),
        '/home': (context) => HomeModule(),
      },
    );
  }

  _buildThemeData(String primaryColor) {
    return ThemeData(
      // NOTE font
        fontFamily: 'Quicksand',
        // NOTE cor brackground
        scaffoldBackgroundColor: Colors.white,
        // NOTE color BottomNavigation
        canvasColor: Colors.white,
        // NOTE primary color
        primaryColor: primaryColor.color,
        accentColor: Colors.white,

        // NOTE AppBarDefatul

        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ));
  }
}
