import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/hive/hive_box.dart';
import 'package:flutter_application_1/weather_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/adapters.dart';

import 'hive/favorite_history.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.top],
  );


  await Hive.initFlutter();
  Hive.registerAdapter(FavoriteHistoryAdapter());
  await Hive.openBox<FavoriteHistory >(HiveBox.favoriteBox);


  await dotenv.load(fileName: '.env');
  runApp(const WeatherApp());
}
