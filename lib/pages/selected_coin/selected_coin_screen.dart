import 'package:crypto_app/constants.dart';
import 'package:crypto_app/model/coin/coin_model.dart';
import 'package:crypto_app/pages/selected_coin/ui_components/button_bottom.dart';
import 'package:crypto_app/pages/selected_coin/ui_components/chart.dart';
import 'package:crypto_app/pages/selected_coin/ui_components/header_info.dart';
import 'package:crypto_app/pages/selected_coin/ui_components/news.dart';
import 'package:crypto_app/pages/selected_coin/ui_components/stats_24h.dart';
import 'package:flutter/material.dart';


class SelectedCoinScreen extends StatelessWidget {
  final CoinModel coinModel;
  const SelectedCoinScreen({super.key,required this.coinModel});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Header Info----------------------------------
              HeaderInfo(coinModel: coinModel, size: size),
              //Stats 24h------------------------------------
              Stats24h(coinModel: coinModel),
              //Chart
              Chart(size: size,coinModel: coinModel),
              //News
              News(size: size),

            ],
          ),
        ),
        //Button Add Notification---------------------
        bottomNavigationBar: ButtonBottom(size: size),
      ),
    );
  }
}


