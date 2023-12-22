import 'package:flutter/material.dart';
import 'package:flutter_application_1/domein/provider/weather_provider.dart';
import 'package:flutter_application_1/ui/style/app_color.dart';
import 'package:flutter_application_1/ui/style/app_style.dart';
import 'package:provider/provider.dart';

class WeekDayItems extends StatelessWidget {
  const WeekDayItems({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<WeatherProvider>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 17),
      decoration: BoxDecoration(
        color: AppColors.weekdaybg.withOpacity(0.6),
        borderRadius: BorderRadius.circular(24),
      ),
      child: SizedBox(
        height: 153,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return DayItem(
              text: model.date[i],
              icon: model.setDailyIcons(i),
              dayTemp: model.setDailyTemp(i),
              windSpeed: '${model.setDailyWindSpeed(i)} km/h',
            );
          },
          separatorBuilder: (context , i) => const SizedBox(width: 40),
          itemCount: model.date.length,
        ),
      ),
    );
  }
}

class DayItem extends StatelessWidget {
  const DayItem({
    super.key,
    required this.dayTemp,
    required this.text,
    required this.icon,
    required this.windSpeed,
  });

  final String text;
  final String icon;
  final int dayTemp;
  final String windSpeed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: AppStyle.fontStyle.copyWith(
            color: AppColors.dayColor,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 12),
        Image.network(icon),
        // Icon(icon, size: 40),
        const SizedBox(height: 7),
        Text(
          '$dayTemp °',
          style: AppStyle.fontStyle.copyWith(
            fontSize: 16,
            color: AppColors.dayColor,
          ),
        ),
        const SizedBox(height: 7),
        Text(
          windSpeed,
          style: AppStyle.fontStyle.copyWith(
            fontSize: 16,
            color: AppColors.dayColor,
          ),
        ),
      ],
    );
  }
}
