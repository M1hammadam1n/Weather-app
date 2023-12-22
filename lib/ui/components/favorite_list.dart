import 'package:flutter/material.dart';
import 'package:flutter_application_1/hive/favorite_history.dart';
import 'package:flutter_application_1/hive/hive_box.dart';
import 'package:flutter_application_1/ui/style/app_color.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import '../../domein/provider/weather_provider.dart';
import '../style/app_style.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<WeatherProvider>();
    return Expanded(
        child: ValueListenableBuilder(
          valueListenable: Hive.box<FavoriteHistory>(HiveBox.favoriteBox).listenable(),
          builder: (context , value, _ ) {
            return ListView.separated(
              padding:const EdgeInsets.all(0),
                itemBuilder:(context,i){
                  return Dismissible(
                    key: UniqueKey(),
                    child: FavoriteCard(
                      index: i,
                      value: value,
                    ),
                    onDismissed: (DismissDirection direction){
                      model.deleteFavorite(i);
                      },
                    );
                }, 
            separatorBuilder: (context, i) => const SizedBox(height: 25),
            itemCount: value.length,
          );
        },
      ),
    );
  }
}


class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    super.key,
    required this.index,
    required this.value,
  });

  final int index;
  final Box<FavoriteHistory> value;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      color: AppColors.favoriteCardColor.withOpacity(0.7),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           CurrentItems(
             index: index,
             value: value,
           ),
           WeatherItems(
             index: index,
             value: value,
           ),
         ],
        ),
      ),
    );
  }
}

class CurrentItems extends StatelessWidget {
  const CurrentItems({
    super.key,
    required this.index,
    required this.value,
  });
  final int index;
  final Box<FavoriteHistory> value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
         Text(
           value.getAt(index)?.cityName ?? 'Error',
           style: AppStyle.fontStyle.copyWith(
             fontSize: 24,
             fontWeight: FontWeight.w700,
           ),
         ),
        const SizedBox(height: 8), 
        Text(
          value.getAt(index)?.currentStatus ?? 'Error',
          style:AppStyle.fontStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.white.withOpacity(0.8),
         ),
        ),
        SizedBox(height: 20),
        RichText(
            text: TextSpan(
                text:
                'Humidity',
                style: AppStyle.fontStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: AppColors.white.withOpacity(0.3),
                ),
              children: [
                TextSpan(
                  text: ' ${value.getAt(index)?.humidity}%',
                  style: AppStyle.fontStyle.copyWith(
                      fontSize: 16,
                  ),
                ),
              ],
            ),
        ),
        const SizedBox(height: 5),
        RichText(
          text: TextSpan(
              text:
              'Wind',
              style: AppStyle.fontStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: AppColors.white.withOpacity(0.3),
              ),
              children: [
                TextSpan(
                  text: ' ${value.getAt(index)?.windSpeed} km/h',
                  style: AppStyle.fontStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ],
          ),
        ),
      ],
    );
  }
}

class WeatherItems extends StatelessWidget {
  const WeatherItems({

    super.key,
    required this.index,
    required this.value,

  });

  final int index;
  final Box<FavoriteHistory> value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.network(
        '${value.getAt(index)?.icon}',
          scale: 0.6,
        ),
        Text(
            '${value.getAt(index)?.temp} °C',
        style: AppStyle.fontStyle.copyWith(
          fontSize: 48,
          fontWeight: FontWeight.w500,
         ),
        ),
      ],
    );
  }
}
