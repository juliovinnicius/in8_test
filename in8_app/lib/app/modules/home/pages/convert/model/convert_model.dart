import 'package:in8_app/app/modules/home/pages/convert/model/rates_model.dart';

class ConvertModel {
  RatesModel rates;
  String base;
  String date;

  ConvertModel({this.rates, this.base, this.date});

  ConvertModel.fromJson(Map<String, dynamic> json) {
    rates = json['rates'] != null ? new RatesModel.fromJson(json['rates']) : null;
    base = json['base'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rates != null) {
      data['rates'] = this.rates.toJson();
    }
    data['base'] = this.base;
    data['date'] = this.date;
    return data;
  }
}