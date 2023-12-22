import 'package:flutter/material.dart';
import 'package:flutter_application_1/domein/provider/weather_provider.dart';
import 'package:flutter_application_1/ui/resources/app_icons.dart';
import 'package:flutter_application_1/ui/style/app_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class RowItems extends StatelessWidget {
  const RowItems({super.key});

  @override
  Widget build(BuildContext context) {
    final model  =context.watch<WeatherProvider>();
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WeatherDesription(
          icon: AppIcons.rainDrops,
          text: 'HUMIDITY',
          values: '${model.setHumidity()}',
        ),
         WeatherDesription(
          icon: AppIcons.windSpeed,
          text: 'WIND',
          values: '${model.setWindSpeed()} Km/h',
        ),
         WeatherDesription(
          icon: AppIcons.thermometer,
          text: 'FEELS LIKE',
          values: '${model.setFeelsLike()}  °',
        ),
      ],
    );
  }
}

class WeatherDesription extends StatelessWidget {
  const WeatherDesription({
    super.key,
    required this.icon,
    required this.text,
    required this.values,
  });

  final String icon, text, values;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(icon),
        const SizedBox(height: 4), 
        Text(
          text,
          style: AppStyle.fontStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          values,
          style: AppStyle.fontStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}