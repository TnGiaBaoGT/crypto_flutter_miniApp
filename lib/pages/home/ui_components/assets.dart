import 'package:flutter/material.dart';

import '../../../constants.dart';

class Assets extends StatelessWidget {
  const Assets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: [
          Text('Assets',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          ),
          Spacer(),
          Icon(Icons.add),
        ],
      ),
    );
  }
}