import 'package:in8_app/app/shareds/controllers/controller_base.dart';
import 'package:mobx/mobx.dart';

part 'historic_controller.g.dart';

class HistoricController = _HistoricBase with _$HistoricController;

abstract class _HistoricBase extends ControllerBase with Store {

  _HistoricBase({List<double>old, List<double> value}){
    oldValue = old;
    newValue = value;
  }

  @observable
  List<double> oldValue;

  @observable
  List<double> newValue;

  @observable
  bool isBusy = true;

}
