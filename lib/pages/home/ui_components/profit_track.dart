import 'package:flutter/material.dart';
import '../../../constants.dart';

class ProfitTrack extends StatelessWidget {
  const ProfitTrack({
    super.key,
    required this.size,
    required this.image,
    required this.money,
  });

  final Size size;
  final String money;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: [
           Text(money,
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w500,
            ),),
          const Spacer(),
          Container(
              height: size.height * 0.04,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(image)),
        ],
      ),
    );
  }
}
