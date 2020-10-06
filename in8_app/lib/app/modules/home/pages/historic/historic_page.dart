import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:in8_app/app/modules/home/home_controller.dart';
import 'package:in8_app/app/modules/home/home_module.dart';
import 'package:in8_app/app/modules/home/pages/convert/convert_controller.dart';
import 'package:in8_app/app/modules/home/pages/convert/convert_module.dart';
import 'package:in8_app/app/modules/home/pages/historic/historic_controller.dart';
import 'package:in8_app/app/modules/home/pages/historic/historic_module.dart';
import 'package:in8_app/app/shareds/helpers/color_helper.dart';
import 'package:in8_app/app/shareds/helpers/database_helper.dart';
import 'package:in8_app/app/shareds/widgets/card_value.dart';
import 'package:in8_app/app/shareds/widgets/empty_list.dart';
import 'package:in8_app/app/shareds/widgets/loading_widget.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class HistoricPage extends StatefulWidget {
  @override
  _HistoricPageState createState() => _HistoricPageState();
}

class _HistoricPageState extends State<HistoricPage> {
  HomeController homeController = HomeModule.to.getBloc<HomeController>();
  HistoricController controller = HistoricModule.to.getBloc<HistoricController>();
  ConvertController convertController = ConvertModule.to.getBloc<ConvertController>();

  final dbHelper = DatabaseHelper.instance;

  @override
  void initState(){
    super.initState();
    (()async {
      await query();
    })();
  }

  List<double> oldValue = List<double>();
  List<double> newValue = List<double>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorLib.colorPrimary.color,
          iconTheme: IconThemeData(color: ColorLib.white.color),
          title: Text(
            'Conversão de Moeda',
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ConvertModule()),
            ),
          ),
        ),
        body: Observer(
          builder:(_) => ListView.builder(
            itemBuilder: (context, i) => CardValue(
              oldValue: controller.oldValue[i],
              newValue: controller.newValue[i],
            ),
            itemCount: oldValue.length,
          ),
        ),
    );
  }

  void query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach((row) {
      print(row['oldValue']);
      oldValue.add(row['oldValue']);
      newValue.add(row['newValue']);
      },
    );
  }
}
