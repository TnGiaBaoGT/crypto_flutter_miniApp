import 'package:crypto_app/constants.dart';
import 'package:flutter/material.dart';

import '../../../assets/app_icons.dart';

class News extends StatelessWidget {
  final Size size;
  const News({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal:kDefaultPadding,vertical: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('News',
            style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),),

            Row(
              children: [
                Expanded(
                    child: SizedBox(
                      height: size.height *0.2,
                  child: const SingleChildScrollView(
                    child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                    ),
                  ),
                )),
                const SizedBox(width: 10),
                Container(
                  height: size.height * 0.2,
                  width: size.width * 0.2,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(AppIcons.explore),
                    ),
                  ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
