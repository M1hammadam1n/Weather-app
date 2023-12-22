import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/style/app_color.dart';

abstract class AppStyle {
    static TextStyle fontStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
      shadows: [
        Shadow(
          color: AppColors.black.withOpacity(0.35),
          offset:const Offset(4,4),
          blurRadius: 30,
        ),
      ],
    );
}