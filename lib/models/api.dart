import 'package:dio/dio.dart';
import 'package:zentara_ville/models/money_model.dart';

import 'house_registraion_model.dart';

class Api {
  var dio = Dio();
  Future<Money> fetchMoney() async {
    try {
      final response = await dio.get(
          'https://script.google.com/macros/s/AKfycbwqHxWz53YfPStqtrLyEHFwsiKd1vSqzEikenICYDmhm_0-lVDz8eoixGvMajTJCBvdVA/exec');
      // final body = response.data;
      if (response.statusCode == 200) {
        // List<dynamic> jsonResponse = jsonDecode(response.data);
        // return jsonResponse.map((e) => CallData.fromJson(e)).toList();
        return Money.fromJson(response.data);
      }
    } catch (e) {}
    return Money(
      success: false,
    );
  }

  Future<HouseRegistration> fetchHouse() async {
    try {
      final response = await dio.get(
          'https://script.google.com/macros/s/AKfycbxCe-nAmfxFWIsxq3u3RJe2wx3jB--9nIv1V5qryWDyAdQhVsHArYxPW4wjvRy2_WCF_Q/exec');
      // final body = response.data;
      if (response.statusCode == 200) {
        // List<dynamic> jsonResponse = jsonDecode(response.data);
        // return jsonResponse.map((e) => CallData.fromJson(e)).toList();
        return HouseRegistration.fromJson(response.data);
      }
    } catch (e) {}
    return HouseRegistration(
      success: false,
    );
  }
}
