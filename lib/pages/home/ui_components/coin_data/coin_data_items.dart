import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../model/coin/coin_model.dart';

class CoinDataItem extends StatelessWidget {
  const CoinDataItem({
    super.key,
    required this.data,
  });

  final CoinModel data;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding/2),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(kDefaultPadding/2),
            height: size.height * 0.09,
            width: size.width * 0.09,
            child: Image.network(data.image),
          ),
          const SizedBox(width: 5),
          SizedBox(
            width: size.width * 0.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.id.toUpperCase(),
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),),
                Text(data.symbol.toUpperCase(),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,color: Colors.grey
                    ),),
              ],
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            height: size.height * 0.06,
            width: size.width * 0.3,
            child: Sparkline(
                data: data.sparklineIn7D.price,
            lineWidth: 2.0,
              lineColor: data.marketCapChangePercentage24H >= 0
              ? Colors.green
              : Colors.red,
              fillMode: FillMode.below,
              fillGradient: LinearGradient(
                begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: data.marketCapChangePercentage24H >= 0
                  ?[Colors.green, Colors.green.shade100]
                  :[Colors.red, Colors.red.shade100]
              ),
            ),
          ),
          const SizedBox(width: 15),
          SizedBox(
            width: size.width * 0.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${data.currentPrice} \$',
                style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                const SizedBox(height: 8),
                Text( data.priceChange24H >= 0
                    ? '+${data.priceChange24H}'
                    : data.priceChange24H.toString(),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: data.priceChange24H >= 0 ? Colors.green : Colors.red,
                  fontSize: 15,
                  fontWeight: FontWeight.w500
                ),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}