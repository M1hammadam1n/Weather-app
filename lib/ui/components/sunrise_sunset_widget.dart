import 'package:flutter/material.dart';
import 'package:flutter_application_1/domein/provider/weather_provider.dart';
import 'package:flutter_application_1/ui/resources/app_icons.dart';
import 'package:flutter_application_1/ui/style/app_color.dart';
import 'package:flutter_application_1/ui/style/app_style.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SunriseSunsetWidget extends StatelessWidget {
  const SunriseSunsetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<WeatherProvider>();
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 40),
      decoration: BoxDecoration(
        color: AppColors.weekdaybg.withOpacity(0.6),
        borderRadius: BorderRadius.circular(24),
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RowItemsWidget(
            icon: AppIcons.sunrise,
            text: 'Восход ${model.setSunRise()}',
          ),
          RowItemsWidget(
            icon: AppIcons.sunset,
            text: 'закат ${model.setSunSet()}',
          ),
        ],
      ),
    );
  }
}


class RowItemsWidget extends StatelessWidget {
  const RowItemsWidget({
    super.key,
    required this.icon,
    required this.text
  });
  final String icon;
  final String text;


  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          icon ,
          color: AppColors.white,
        ),
        const SizedBox(height: 20),
        Text(
          text,
          style: AppStyle.fontStyle.copyWith(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
