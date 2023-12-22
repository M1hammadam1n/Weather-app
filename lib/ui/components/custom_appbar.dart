import 'package:flutter/material.dart';
import 'package:flutter_application_1/domein/provider/weather_provider.dart';
import 'package:flutter_application_1/ui/resources/app_icons.dart';
import 'package:flutter_application_1/ui/routes/app_routes.dart';
import 'package:flutter_application_1/ui/style/app_color.dart';
import 'package:flutter_application_1/ui/style/app_style.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<WeatherProvider>();
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton.icon(
            onPressed: () {
              model.setFavorite(
                  context,
                  cityName: model.currentCity,
              );
            },
            icon: SvgPicture.asset(
               AppIcons.location,
              color: AppColors.red,
            ),
            label: Text(
              model.currentCity,
              style: AppStyle.fontStyle.copyWith(
                fontSize: 18,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              context.go(AppRoutes.search);
            },
            icon: Icon(
            Icons.menu,
            color: AppColors.white,),
          ),
        ],
      ),
    );
  }
}