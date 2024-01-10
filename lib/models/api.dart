import 'package:dio/dio.dart';
import 'package:zentara_ville/models/data_model.dart';

class Api {
  var dio = Dio();
  Future<Money> fetchAll() async {
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
}
