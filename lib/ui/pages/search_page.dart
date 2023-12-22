import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/components/search_appbar.dart';

import '../components/favorite_list.dart';
import '../style/app_style.dart';

class searchPage extends StatelessWidget {
  const searchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors:[
              Color(0XFF391A49),
              Color(0XFF301D5C),
              Color(0XFF262171),
              Color(0XFF262171),
              Color(0XFF301D5C),
              Color(0XFF391A49),
            ],
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding:const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const SearchAppbar(),
           const SizedBox(height: 20),
            Text(
              'Saved Locations',
             style: AppStyle.fontStyle.copyWith(
               fontSize: 18,
             ),
            ),
            const SizedBox(height: 25),
            const FavoriteList(),
          ],
        ),
      ),
    );
  }
}
