import 'package:crypto_app/constants.dart';
import 'package:flutter/material.dart';

class ButtonBottom extends StatelessWidget {
  final Size size;
  const ButtonBottom({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.09,
      child: Column(
        children: [
          Divider(
            thickness: 3,
            color: Colors.black.withOpacity(0.2),
          ),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding/3),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(kDefaultPadding/2),
                  alignment: Alignment.center,
                  width: size.width * 0.7,
                  decoration: BoxDecoration(
                    color: const Color(0xffFBC700),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text('Add To Portfolio',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),),
                ),
                const SizedBox(width: 5),
                Expanded(
                    child: Container(
                      height: size.height * 0.05,
                      decoration: BoxDecoration(
                        color: const Color(0xffFBC700).withOpacity(0.4),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications)),
                    )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
