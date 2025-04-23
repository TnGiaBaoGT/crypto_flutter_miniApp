import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../model/coin/coin_model.dart';


class Stats24h extends StatelessWidget {
  const Stats24h({
    super.key,
    required this.coinModel,
  });

  final CoinModel coinModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding/2,horizontal: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildColumn('High','${coinModel.high24H}\$'),
          buildColumn('Low','${coinModel.low24H}\$'),
          buildColumn('Vol','${coinModel.totalVolume}\$'),
        ],
      ),
    );
  }

  Column buildColumn(String title, String content) {
    return Column(
          children: [
            Text(title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.grey,
            ),),
            Text(content,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),),
          ],
        );
  }
}
