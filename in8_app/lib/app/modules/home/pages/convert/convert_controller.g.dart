// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'convert_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConvertController on _ConvertBase, Store {
  final _$coinsAtom = Atom(name: '_ConvertBase.coins');

  @override
  String get coins {
    _$coinsAtom.reportRead();
    return super.coins;
  }

  @override
  set coins(String value) {
    _$coinsAtom.reportWrite(value, super.coins, () {
      super.coins = value;
    });
  }

  final _$coinsConvertAtom = Atom(name: '_ConvertBase.coinsConvert');

  @override
  double get coinsConvert {
    _$coinsConvertAtom.reportRead();
    return super.coinsConvert;
  }

  @override
  set coinsConvert(double value) {
    _$coinsConvertAtom.reportWrite(value, super.coinsConvert, () {
      super.coinsConvert = value;
    });
  }

  final _$newValueAtom = Atom(name: '_ConvertBase.newValue');

  @override
  double get newValue {
    _$newValueAtom.reportRead();
    return super.newValue;
  }

  @override
  set newValue(double value) {
    _$newValueAtom.reportWrite(value, super.newValue, () {
      super.newValue = value;
    });
  }

  final _$convertModelAtom = Atom(name: '_ConvertBase.convertModel');

  @override
  ConvertModel get convertModel {
    _$convertModelAtom.reportRead();
    return super.convertModel;
  }

  @override
  set convertModel(ConvertModel value) {
    _$convertModelAtom.reportWrite(value, super.convertModel, () {
      super.convertModel = value;
    });
  }

  final _$valueControllerAtom = Atom(name: '_ConvertBase.valueController');

  @override
  TextEditingController get valueController {
    _$valueControllerAtom.reportRead();
    return super.valueController;
  }

  @override
  set valueController(TextEditingController value) {
    _$valueControllerAtom.reportWrite(value, super.valueController, () {
      super.valueController = value;
    });
  }

  final _$newValueControllerAtom =
      Atom(name: '_ConvertBase.newValueController');

  @override
  TextEditingController get newValueController {
    _$newValueControllerAtom.reportRead();
    return super.newValueController;
  }

  @override
  set newValueController(TextEditingController value) {
    _$newValueControllerAtom.reportWrite(value, super.newValueController, () {
      super.newValueController = value;
    });
  }

  final _$oldValueConvertAtom = Atom(name: '_ConvertBase.oldValueConvert');

  @override
  List<double> get oldValueConvert {
    _$oldValueConvertAtom.reportRead();
    return super.oldValueConvert;
  }

  @override
  set oldValueConvert(List<double> value) {
    _$oldValueConvertAtom.reportWrite(value, super.oldValueConvert, () {
      super.oldValueConvert = value;
    });
  }

  final _$newValueConvertAtom = Atom(name: '_ConvertBase.newValueConvert');

  @override
  List<double> get newValueConvert {
    _$newValueConvertAtom.reportRead();
    return super.newValueConvert;
  }

  @override
  set newValueConvert(List<double> value) {
    _$newValueConvertAtom.reportWrite(value, super.newValueConvert, () {
      super.newValueConvert = value;
    });
  }

  final _$getConvertAsyncAction = AsyncAction('_ConvertBase.getConvert');

  @override
  Future<Null> getConvert({String coin}) {
    return _$getConvertAsyncAction.run(() => super.getConvert(coin: coin));
  }

  final _$_ConvertBaseActionController = ActionController(name: '_ConvertBase');

  @override
  dynamic convertCoin() {
    final _$actionInfo = _$_ConvertBaseActionController.startAction(
        name: '_ConvertBase.convertCoin');
    try {
      return super.convertCoin();
    } finally {
      _$_ConvertBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
coins: ${coins},
coinsConvert: ${coinsConvert},
newValue: ${newValue},
convertModel: ${convertModel},
valueController: ${valueController},
newValueController: ${newValueController},
oldValueConvert: ${oldValueConvert},
newValueConvert: ${newValueConvert}
    ''';
  }
}
