import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../model/coin/coin_model.dart';

class HeaderInfo extends StatelessWidget {
  const HeaderInfo({
    super.key,
    required this.coinModel,
    required this.size,
  });

  final CoinModel coinModel;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding,horizontal: kDefaultPadding),
      child: Row(
        children: [
          Image.network(coinModel.image,height: size.height*0.08,),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(coinModel.id.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),),
              Text(coinModel.symbol.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${coinModel.currentPrice}\$",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),),
              Text(
                coinModel.marketCapChangePercentage24H >= 0
                    ?
                "+${coinModel.marketCapChangePercentage24H.toStringAsFixed(2)}%"
                    :
                "${coinModel.marketCapChangePercentage24H.toStringAsFixed(2)}%",
                style: TextStyle(
                  color: coinModel.marketCapChangePercentage24H >= 0
                      ? Colors.green
                      : Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

