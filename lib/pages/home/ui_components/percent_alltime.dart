import 'package:crypto_app/constants.dart';
import 'package:flutter/material.dart';


class PercentAlltime extends StatelessWidget {
  const PercentAlltime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left:kDefaultPadding,bottom: kDefaultPadding+20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Today P&L',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14)),
          SizedBox(width: 4),
          Text('+',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14)),
          SizedBox(width: 2),
          Text('82%',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14)),
          
        ],),
    );
  }
}