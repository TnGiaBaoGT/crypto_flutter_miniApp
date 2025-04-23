import 'package:crypto_app/assets/app_icons.dart';
import 'package:crypto_app/constants.dart';
import 'package:crypto_app/model/tab/tab_data.dart';
import 'package:crypto_app/pages/home/ui_components/assets.dart';
import 'package:crypto_app/pages/home/ui_components/coin_data/coin_list.dart';
import 'package:crypto_app/pages/home/ui_components/percent_alltime.dart';
import 'package:crypto_app/pages/home/ui_components/profit_track.dart';
import 'package:crypto_app/pages/home/ui_components/recommend_coin/recommend_coin.dart';
import 'package:crypto_app/pages/home/ui_components/tab_menu.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabdata = TabData();
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                  end: Alignment.topCenter,
                  colors: [
                      Color(0xfff3e062),
                      Color(0xffFBC700),
                  ]),
            ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TabMenu(tabdata: tabdata),
          
                  ProfitTrack(size: size,money: '\$ 1.265,24',image: AppIcons.profitTrack,),
          
                   const PercentAlltime(),
          
                  Container(
                    height: size.height * 0.7,
                    width: size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )
                    ),
                    child: const Column(
                      children: [
                        Assets(),
                        CoinList(),
                        SizedBox(height: 5),
                        RecommendCoin(),
                      ],
                    ),
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }
}






