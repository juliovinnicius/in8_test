// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historic_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HistoricController on _HistoricBase, Store {
  final _$oldValueAtom = Atom(name: '_HistoricBase.oldValue');

  @override
  List<double> get oldValue {
    _$oldValueAtom.reportRead();
    return super.oldValue;
  }

  @override
  set oldValue(List<double> value) {
    _$oldValueAtom.reportWrite(value, super.oldValue, () {
      super.oldValue = value;
    });
  }

  final _$newValueAtom = Atom(name: '_HistoricBase.newValue');

  @override
  List<double> get newValue {
    _$newValueAtom.reportRead();
    return super.newValue;
  }

  @override
  set newValue(List<double> value) {
    _$newValueAtom.reportWrite(value, super.newValue, () {
      super.newValue = value;
    });
  }

  final _$isBusyAtom = Atom(name: '_HistoricBase.isBusy');

  @override
  bool get isBusy {
    _$isBusyAtom.reportRead();
    return super.isBusy;
  }

  @override
  set isBusy(bool value) {
    _$isBusyAtom.reportWrite(value, super.isBusy, () {
      super.isBusy = value;
    });
  }

  @override
  String toString() {
    return '''
oldValue: ${oldValue},
newValue: ${newValue},
isBusy: ${isBusy}
    ''';
  }
}
