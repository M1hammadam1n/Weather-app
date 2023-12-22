import 'package:flutter/material.dart';
import 'package:flutter_application_1/domein/provider/weather_provider.dart';
import 'package:flutter_application_1/ui/routes/app_router.dart';
import 'package:provider/provider.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ), 
    );
  }
}
