import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model.dart';

class WeatherService {
  String baseUrl = "http://api.weatherapi.com/v1";
  String apiKey = "ae9284cc8cd247408b4105628240407";
  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url = Uri.parse(
        "$baseUrl/forecast.json?q=$cityName&days=3&key=$apiKey");
    http.Response response = await http.get(url);
    Map<String, dynamic> data=jsonDecode(response.body);
    if (response.statusCode != 200) {
      throw Exception(data['error']['message']);
    }
    if (data['location'] == null) {
      throw Exception(data['error']['message']);
    }
    print('dddddd$data');
    WeatherModel weather=WeatherModel.fromJson(data);
    print('wwwwwww$weather');

    return weather;

  }
}
