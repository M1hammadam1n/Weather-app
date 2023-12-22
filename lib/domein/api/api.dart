import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/domein/models/city_photo.dart';
import 'package:flutter_application_1/domein/models/coord.dart';
import 'package:flutter_application_1/domein/models/weather_data.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Api {
  static final apikey = dotenv.get('API_KEY');
  static final accesskey = dotenv.get('ACCESS_KEY');
  static final dio = Dio();
  // https://api.openweathermap.org/data/2.5/weather?q=London&appid=49cc8c821cd2aff9af04c9f98c36eb74

  static Future<Coord> getCoords({String? cityName = 'Ташкент'}) async {
    final response = await dio.get(
      'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apikey&lang=ru',
    );

    try {
      final coords = Coord.fromJson(response.data);
      return coords;
    } catch (e) {
      final coords = Coord.fromJson(response.data);
      return coords;
    }
  }
  //сылка для получения погоды

  // https://api.openweathermap.org/data/2.5/onecall?lat=55.7522&lon=37.6156&exclude=hourly,minutely&appid=49cc8c821cd2aff9af04c9f98c36eb74

  static Future<WeatherData?> getWeather(Coord? coord) async {
    if (coord != null) {
      final lat = coord.lat.toString();
      final lon = coord.lon.toString();
      final response = await dio.get(
          'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=hourly,minutely&appid=$apikey&lang=ru');
      final weatherData = WeatherData.fromJson(response.data);
      return weatherData;
    }
    return null;
  }

  //ссылка для получения заднего фона
  //https://api.unsplash.com/search/photos?query=Tashkent

  static Future<CityPhotos> getPhoto({String cityName = 'Ташкент'}) async {
    final url =
        Uri.parse('https://api.unsplash.com/search/photos?query=$cityName');

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Client-ID $accesskey',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> date = json.decode(response.body);
      return CityPhotos.fromJson(date);
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }
}
