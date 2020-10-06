import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:in8_app/app/modules/home/home_controller.dart';
import 'package:in8_app/app/modules/home/pages/convert/convert_controller.dart';
import 'package:in8_app/app/modules/home/pages/convert/convert_module.dart';
import 'package:in8_app/app/modules/home/pages/historic/historic_module.dart';
import 'package:in8_app/app/shareds/constants/geral_contants.dart';
import 'package:in8_app/app/shareds/helpers/color_helper.dart';
import 'package:in8_app/app/shareds/helpers/database_helper.dart';
import 'package:in8_app/app/shareds/widgets/input_hover_widget.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../home_module.dart';

class ConvertPage extends StatefulWidget {
  @override
  _ConvertPageState createState() => _ConvertPageState();
}

class _ConvertPageState extends State<ConvertPage> {

  ConvertController controller = ConvertModule.to.getBloc<ConvertController>();
  HomeController homeController = HomeModule.to.getBloc<HomeController>();

  final dbHelper = DatabaseHelper.instance;


  @override
  void initState() {
    super.initState();
    query();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorLib.colorPrimary.color,
        iconTheme: IconThemeData(
          color: ColorLib.white.color
        ),
        title: Text('Conversão de Moeda',),
        actions: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HistoricModule(
                  oldvalue: controller.oldValueConvert,
                  newvalue: controller.newValueConvert,
                ),
                ),
              );
            },
            color: ColorLib.colorPrimary.color,
            child: TextResponsive(
              'Histórico',
              style: TextStyle(
                color: ColorLib.white.color
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                top: 25,
                left: DEFAULT_PADDING_W,
                right: DEFAULT_PADDING_W
              ),
              child: dropDownCoins(),
            ),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.only(
                  left: DEFAULT_PADDING_W,
                  right: DEFAULT_PADDING_W
              ),
              child: InputHoverWidget(
                controller: controller.valueController,
                hint: 'Valor R\$',
                keyboardType: TextInputType.number,
                color: ColorLib.black.color,
                hintColor: ColorLib.black.color,
                borderColor: ColorLib.silver.color,
              ),
            ),
            SizedBox(height: 25,),
            Container(
              padding: EdgeInsets.only(
                  top: 25,
                  left: DEFAULT_PADDING_W,
                  right: DEFAULT_PADDING_W
              ),
              child: dropDownConvertCoins(),
            ),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.only(
                  left: DEFAULT_PADDING_W,
                  right: DEFAULT_PADDING_W
              ),
              child: InputHoverWidget(
                controller: controller.newValueController,
                enabled: false,
                hint: 'Novo valor R\$',
                keyboardType: TextInputType.number,
                color: ColorLib.black.color,
                hintColor: ColorLib.black.color,
                borderColor: ColorLib.silver.color,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: ContainerResponsive(
          margin: EdgeInsetsResponsive.only(
            left: DEFAULT_PADDING_W,
            right: DEFAULT_PADDING_W,
            bottom: 10
          ),
          height: 46,
          width: MediaQuery.of(context).size.width * 0.8,
          child: RaisedButtonResponsive(
            onPressed: () async{
              controller.convertCoin();
              await insertDB();
              await query();
            },
            color: ColorLib.colorPrimary.color,
            child: TextResponsive(
              'Converter',
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
      ),
    );
  }

  Widget dropDownCoins() => Observer(
    builder: (_) => Theme(
      data: Theme.of(context).copyWith(
        canvasColor: ColorLib.white.color,
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        value: controller.coins,
        hint: Text(
          'Tipo moeda',
          style: TextStyle(
            color: ColorLib.black.color,
          ),
        ),
        icon: Icon(
          Icons.arrow_drop_down,
          color: ColorLib.black.color,
        ),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        onChanged: (String newValue) async {
          setState(() {
            controller.coins = newValue;
          });
          print('${controller.coins}');
          await controller.getConvert(coin: controller.coins);
        },
        items: controller.coinList.map(
              (String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: ContainerResponsive(
                child: Text(
                  value,
                  style: TextStyle(
                    color: ColorLib.black.color,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Quicksand',
                  ),
                ),
              ),
            );
          },
        ).toList()),
      ),
    );

  Widget dropDownConvertCoins() => Observer(
    builder: (_) => Theme(
      data: Theme.of(context).copyWith(
        canvasColor: ColorLib.white.color,
      ),
      child: DropdownButton<double>(
          isExpanded: true,
          value: controller.coinsConvert,
          hint: Text(
            'Moeda Desejada',
            style: TextStyle(
              color: ColorLib.black.color,
            ),
          ),
          icon: Icon(
            Icons.arrow_drop_down,
            color: ColorLib.black.color,
          ),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          onChanged: (double newValue) async {
            setState(() {
              controller.coinsConvert = newValue;
            });
            print('${controller.coinsConvert}');
          },
          items: controller.initialConvert.map(
                (key, value) {
              return MapEntry(
                key,
                DropdownMenuItem<double>(
                  value: value,
                  child: Text(
                    key,
                    style: TextStyle(
                      color: ColorLib.black.color,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Quicksand',
                    ),
                  ),
                )
              );
            },
          ).values.toList(),
      ),
    ),
  );

  void insertDB() async {

    Map<String, dynamic> row = {
      DatabaseHelper.columnOldValue : double.parse(controller.valueController.text),
      DatabaseHelper.columnNewValue  : double.parse(controller.newValueController.text)
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }

  void query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach((row) {
      print(row['oldValue']);
      controller.oldValueConvert.add(row['oldValue']);
      controller.newValueConvert.add(row['newValue']);
    },
    );
  }
}
