import 'package:dio/dio.dart';
import 'package:in8_app/app/modules/home/pages/convert/model/convert_model.dart';

class ConvertRepository {

  Future<ConvertModel> getConvert(String moeda) async {
    try {
      Response response = await Dio().get(
        'https://api.exchangeratesapi.io/latest?base=$moeda',
      );
      return ConvertModel.fromJson(response.data);
    } catch (e) {
      throw e;
    }
  }
}
