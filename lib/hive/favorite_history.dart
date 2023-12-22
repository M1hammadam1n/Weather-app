import 'package:hive/hive.dart';
part 'favorite_history.g.dart';

// flutter packages pub run build_runner build --delete-conflicting-outputs

@HiveType(typeId: 0)
class FavoriteHistory{
  @HiveField(0)
  String cityName;
  @HiveField(1)
  String currentStatus;
  @HiveField(2)
  String humidity;
  @HiveField(3)
  String windSpeed;
  @HiveField(4)
  String temp;
  @HiveField(5)
  String icon;
  FavoriteHistory({
    required this.cityName,
    required this.currentStatus,
    required this.icon,
    required this.windSpeed,
    required this.temp,
    required this.humidity,
  });
}