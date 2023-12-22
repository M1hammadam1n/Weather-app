import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/style/app_color.dart';
import 'package:flutter_application_1/ui/style/app_style.dart';
import 'package:provider/provider.dart';

import '../../domein/provider/weather_provider.dart';

class SearchAppbar extends StatelessWidget {
  const SearchAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<WeatherProvider>();
    return SafeArea(
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            const AnimatedSearch(),
              IconButton(
                  onPressed: (){
                    model.setCurrentCity(context);
                  },
                  icon: Icon(
                    Icons.search_rounded,
                    color: AppColors.white,
                    size: 35,
                  ),
                ),
              ],
            ),
          ),
        );
      }
    }

    class AnimatedSearch extends StatelessWidget {
      const AnimatedSearch({super.key});

      @override
      Widget build(BuildContext context) {
        final model = context.watch<WeatherProvider>();
        return Stack(
          children: [
            Text(
              'Saved Locations',
              style: AppStyle.fontStyle.copyWith(
                fontSize: 18,
              ),
            ),
            AnimatedContainer(
              duration: Duration(
                  milliseconds: 500,
              ),
              height: 30,
              width: 270,
              child: TextField(
                controller: model.SearchController,
                decoration: InputDecoration(
                    fillColor:AppColors.dayColor,
                    filled: true,
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                      contentPadding:const EdgeInsets.symmetric(horizontal: 10,),
                      hintText: 'Введите название города...',
                      hintStyle: AppStyle.fontStyle.copyWith(
                      fontSize: 14,
                      color:AppColors.black.withOpacity(0.5)
                  ),
                ),
              ),
            ),
          ],
        );
      }
    }
