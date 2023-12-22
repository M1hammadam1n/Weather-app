import 'package:flutter/material.dart';
import 'package:flutter_application_1/domein/api/api.dart';
import 'package:flutter_application_1/domein/models/city_photo.dart';
import 'package:flutter_application_1/domein/models/coord.dart';
import 'package:flutter_application_1/domein/models/weather_data.dart';
import 'package:flutter_application_1/hive/favorite_history.dart';
import 'package:flutter_application_1/hive/hive_box.dart';
import 'package:flutter_application_1/ui/resources/app_bg.dart';
import 'package:flutter_application_1/ui/routes/app_routes.dart';
import 'package:flutter_application_1/ui/style/app_color.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeatherProvider extends ChangeNotifier {
  //хранение координат
  Coord? coords;

  //хранение данных о погоде

  WeatherData? weatherData;

  //храненить текущие о погоде

  Current? current;

  //хранение текущих данных о фотографиях

  CityPhotos? cityPhotos;

  //контроллер ввода для поиска и установки города

  final SearchController = TextEditingController();

  /*главная функция которую мы будем запускать в FutureBuilder*/
  Future<WeatherData?> setUp({String? cityName}) async {
    cityName = (await pref).getString('city_name');
    coords = await Api.getCoords(cityName: cityName ?? 'Ташкент');
    weatherData = await Api.getWeather(coords);
    current = weatherData?.current;
    cityPhotos = await Api.getPhoto(cityName: cityName ?? 'Ташкент');
    // getphotos(cityname: cityName ?? 'Ташкент');
    setCurrentDay();
    setCurrentDayTime();
    setCurrentTime();
    setCurrentTemp();
    setWeekDay();
    getCurrentCity();
    return weatherData;
  }

  final pref = SharedPreferences.getInstance();

  //установка текушего города
 Future<void> setCurrentCity(BuildContext context, {String?
 cityName}) async {
    if (SearchController.text != '') {
      cityName = SearchController.text;
      (await pref).setString('city_name' , cityName);
      await setUp(cityName: (await pref).getString('city_name'))
          .then((value) => context.go(AppRoutes.home))
          .then((value) => SearchController.clear());
      notifyListeners();
    }
 }

 String currentCity = '';
 Future<String> getCurrentCity() async{
   currentCity = (await pref).getString('city_name') ?? 'Ташкент';
   return capitalize(currentCity);
 }

  Future<CityPhotos?> getphotos({String? cityname}) async {
    cityPhotos = await Api.getPhoto(cityName: cityname ?? 'Ташкент');
    return cityPhotos;
  }

  
  //текущая Дата 
  
  String? currentDay;
  String setCurrentDay(){
  final getTime = (current?.dt ?? 0) + (weatherData?.timezoneOffset ?? 0);
  final setTime = DateTime.fromMillisecondsSinceEpoch(getTime * 1000);
  currentDay = DateFormat('MMMM d').format(setTime);
  return currentDay ?? 'Error';
  }
  
  //текущая Дата ./././
  String? currentDayTime;
  String setCurrentDayTime(){
  final getTime = (current?.dt ?? 0) + (weatherData?.timezoneOffset ?? 0);
  final setTime = DateTime.fromMillisecondsSinceEpoch(getTime * 1000);
  currentDayTime = DateFormat('yMd').format(setTime);
  return currentDayTime ?? 'Error';
  }
    //текущая Время
  String? currentTime;
  String setCurrentTime(){
  final getTime = (current?.dt ?? 0) + (weatherData?.timezoneOffset ?? 0);
  final setTime = DateTime.fromMillisecondsSinceEpoch(getTime * 1000);
  currentTime = DateFormat('HH:mm a').format(setTime);
  return currentTime ?? 'Error';
  }

  //получение текущей иконки в зависимости от погоды

  final String _weatherIconUrl = 'https://api.openweathermap.org/img/w/';

  String iconData(){
    return '$_weatherIconUrl${current?.weather?[0].icon}.png';
  }
  //метод превращения первой буквы слова в заглавную , остальные строчные
  String capitalize(String str) => str[0].toUpperCase() + str.substring(1);


  //текущий статус пагоды

  String currentStatus = '';
  String getCurrentStatus() {
    currentStatus  = current?.weather?[0].description ?? 'Ошибка';
    return capitalize(currentStatus);
  }
  //получение текущей температуры

  int kelvin =  -273;
  int currentTemp = 0;
  int setCurrentTemp(){
    currentTemp  =((current?.temp  ?? -kelvin) + kelvin).round();
    return currentTemp;
  }
  //влажность
  int Humidity = 0;
  int setHumidity(){
    Humidity = ((current?.humidity ?? 0 ) / 1).round();
    return Humidity;
  }
  // скорость ветра

  dynamic winSpeed = 0;
  dynamic setWindSpeed(){
    winSpeed = current?.windSpeed ?? 0;
    return winSpeed;
  }


  //15.6 = 15 toint(),
  //15.6 = 16 round()

  //*ощущение тампературы */

  int feelsLike = 0;
  int setFeelsLike (){
    feelsLike  = ((current?.feelsLike ??  - kelvin) + kelvin).round();
    return feelsLike;
  }

  // установка дней недели

  final List<String> date = [];
  List<Daily> daily = [];

  void setWeekDay (){
    daily  = weatherData?.daily ?? [];
    for (var i = 0; i < daily.length; i ++) {
      if(i == 0 && daily.isNotEmpty){
        date.clear();
      }
      var timeNum = daily[i].dt * 1000;
      var itemDate = DateTime.fromMillisecondsSinceEpoch(timeNum);
      date.add(capitalize(DateFormat('EEE d').format(itemDate)));
    }
    }


    //получение иконок на каждый де нь

    String setDailyIcons(int index){
    final String getIcon = '${weatherData?.daily?[index].weather?[0].icon}';
    final String setIcon = '$_weatherIconUrl$getIcon.png';
    return setIcon;
  }

  //получение погоды на каждый день
   int  dayTemp = 0;
   int setDailyTemp(int index){
    dayTemp = ((weatherData?.daily?[index].temp?.day ?? - kelvin)+ kelvin).round();
    return dayTemp;
  }
  //получение скорости ветра на каждый день
  int dailyWindSpeed = 0;

  int setDailyWindSpeed(int index){
    dailyWindSpeed = (weatherData?.daily?[index].windSpeed ?? 0).round();
    return dailyWindSpeed;
  }

  //время восхода
  String sunRise = '';

  String setSunRise() {
    final getSunTime =
    (current?.sunrise ?? 0) + (weatherData?.timezoneOffset ?? 0);
    final setSunrise = DateTime.fromMillisecondsSinceEpoch(getSunTime * 1000);
    sunRise = DateFormat('HH:mm a').format(setSunrise);
    return sunRise;
  }

//время заката
  String sunSet = '';

  String setSunSet() {
    final getSunTime =
        (current?.sunset ?? 0) + (weatherData?.timezoneOffset ?? 0);
    final setSunrise = DateTime.fromMillisecondsSinceEpoch(getSunTime * 1000);
    sunSet = DateFormat('HH:mm a').format(setSunrise);
    return sunSet;
  }

  // установка заднего фона
  String? currentBg;

  String setBg() {
    int id = current?.weather?[0].id ?? -1;
    if(id == -1 || current?.sunset == null || current?.dt == null) {
      currentBg = AppBg.shinyDay;
    }
    try{
      if(current?.sunset < current?.dt){
        if(id >= 200 && id <= 531){
          AppColors.white = const Color(0XFFC6C6C6);
          currentBg = AppBg.rainNight;
        }else if(id>=600 && id <= 622){
          currentBg = AppBg.snowNight;
        }else if (id >= 701 && id <= 781){
          currentBg = AppBg.fogNight;
        }else if (id == 800) {
          currentBg = AppBg.shinyNight;
        }else if (id >= 801 && id <= 804){
          currentBg = AppBg.cloudyNight;
        }
      }else{
        if(id >= 200 && id <= 531){
          currentBg = AppBg.rainDay;
          AppColors.white = const Color(0XFF030708);
        }else if(id>=600 && id <= 622){
          currentBg = AppBg.snowDay;
        }else if (id >= 701 && id <= 781){
          currentBg = AppBg.fogDay;
        }else if (id == 800) {
          currentBg = AppBg.shinyDay;
        }else if (id >= 801 && id <= 804){
          currentBg = AppBg.cloudyDay;
        }
      }
    }catch (e){
      return AppBg.shinyDay;
    }
    return currentBg ?? AppBg.shinyDay;
  }

  //добавление в избранное
  Future<void> setFavorite(BuildContext context , {String? cityName}) async{
    var box = Hive.box<FavoriteHistory>(HiveBox.favoriteBox);
    box.add(FavoriteHistory(
        cityName: currentCity,
        currentStatus: currentStatus,
        icon: iconData(),
        windSpeed: '${setWindSpeed()}',
        temp: '$currentTemp',
        humidity: '${setHumidity()}',
      ),
    ).then(
            (value) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: AppColors.favoriteCardColor,
                  content: Text('Город $cityName добавлен в избранное'),
              ),
            ),
    );
  }
  //удаление из избранного
  
  Future<void> deleteFavorite(int index) async{
    var box = Hive.box<FavoriteHistory>(HiveBox.favoriteBox);
    box.deleteAt(index);
  }
  
  
  
}


