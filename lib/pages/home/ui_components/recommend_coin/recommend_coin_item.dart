import 'package:crypto_app/pages/selected_coin/selected_coin_screen.dart';
import 'package:flutter/material.dart';
import '../../../../constants.dart';
import '../../../../model/coin/coin_model.dart';


class RecommendCoinItem extends StatelessWidget {
  const RecommendCoinItem({
    super.key,
    required this.data,
  });

  final CoinModel data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder:
        (context) => SelectedCoinScreen(coinModel: data)));
      },
      child: Container(
        width: 120,
        margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        padding: const EdgeInsets.all(kDefaultPadding/2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black45),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(data.image,height: 30,),
            SizedBox(
              width: 80,
              child: Text(data.id.toUpperCase(),
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),),
            ),
            SizedBox(
                width: 80,
                child: Text(
                  data.priceChange24H >= 0
                      ? '+${data.priceChange24H.toStringAsFixed(6)}'
                      : data.priceChange24H.toStringAsFixed(6),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),)),
            Text('${data.marketCapChangePercentage24H.toStringAsFixed(2)}%',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: data.marketCapChangePercentage24H >= 0
                      ? Colors.green
                      : Colors.red
              ),
            ),

          ],
        ),
      ),
    );
  }
}

