import 'package:flutter/material.dart';
import 'package:in8_app/app/modules/home/pages/convert/convert_repository.dart';
import 'package:in8_app/app/modules/home/pages/convert/model/convert_model.dart';
import 'package:in8_app/app/shareds/controllers/controller_base.dart';
import 'package:in8_app/app/shareds/helpers/database_helper.dart';
import 'package:mobx/mobx.dart';

part 'convert_controller.g.dart';

class ConvertController = _ConvertBase with _$ConvertController;

abstract class _ConvertBase extends ControllerBase with Store {
  ConvertRepository repository = ConvertRepository();

  _ConvertBase() {}

  @observable
  String coins;

  @observable
  double coinsConvert;

  @observable
  double newValue;

  @observable
  ConvertModel convertModel = ConvertModel();

  @observable
  TextEditingController valueController = TextEditingController();

  @observable
  TextEditingController newValueController = TextEditingController();

  @observable
  List<double> oldValueConvert = List<double>();

  @observable
  List<double> newValueConvert = List<double>();

  @action
  Future<Null> getConvert({String coin}) async {
    try {
      if (isBusy) return;

      isBusy = true;

      convertModel = await repository.getConvert(coin);
      getDictionary();
    } catch (e) {
      rethrow;
    } finally {
      isBusy = false;
    }
  }

  List<String> initialCoins = List<String>();
  List<double> initialsValue = List<double>();

  Map<String, double> initialConvert = {};

  getDictionary() {
    var dictionary =
    Map.fromEntries(convertModel.rates.toJson().entries.map((e) => MapEntry(e.key, e.value)));
    for (var initials in dictionary.entries) {
      initialConvert.putIfAbsent(initials.key, () => initials.value);
    }
  }

  @action
  convertCoin(){
    newValueController.text = (double.parse(valueController.text) * coinsConvert).toStringAsFixed(2);
  }

  List<String> coinList = [
    "CAD",
    "HKD",
    "ISK",
    "PHP",
    "DKK",
    "HUF",
    "CZK",
    "GBP",
    "RON",
    "SEK",
    "IDR",
    "INR",
    "BRL",
    "RUB",
    "HRK",
    "JPY",
    "THB",
    "CHF",
    "EUR",
    "MYR",
    "BGN",
    "TRY",
    "CNY",
    "NOK",
    "NZD",
    "ZAR",
    "USD",
    "MXN",
    "SGD",
    "AUD",
    "ILS",
    "KRW",
    "PLN"
  ];
}
