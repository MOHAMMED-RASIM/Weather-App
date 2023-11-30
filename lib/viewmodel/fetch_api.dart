import 'dart:convert';
import 'package:weather/model/forecastmodel.dart';
import 'package:weather/model/modelclass.dart';
import 'package:http/http.dart' as http;
import 'package:weather/viewmodel/geocode.dart';

String api = "946112ec7576d1de7a58ed65379f03cd";
Future<WeatherModel> fetchWeather(context) async {
  final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$api&units=metric');

  print(latitude);
  print(longitude);


  final response = await http.get(url);
  final body = jsonDecode(response.body);
  if (response.statusCode == 200) {
    return WeatherModel.fromJson(body);
  } else {

    throw Exception('Failed to load album');

  }
}

// FORECAST.........

Future<forecastmodel> Forecast(context) async {
  final url = Uri.parse(
      'http://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=946112ec7576d1de7a58ed65379f03cd&units=metric');

  final response = await http.get(url);
  final body = jsonDecode(response.body);
  print(response.body);
  if (response.statusCode == 200) {
    return forecastmodel.fromJson(body);
  } else {

    throw Exception('Failed to load album');
  }
}



