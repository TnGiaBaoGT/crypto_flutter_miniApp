import 'package:crypto_app/assets/app_images.dart';
import 'package:crypto_app/pages/navBar/nav_bar.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.asset(AppImages.loading),

          Text(
            'The Future',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30,horizontal: 50),
            child: Text(
              textAlign: TextAlign.center,
              'Learn more about cryptocurrency, look to the future in IO Crypto',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),


         const Spacer(),

         Padding(
             padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 50),
           child: GestureDetector(
             onTap: () {
               Navigator.pushReplacement(context, MaterialPageRoute(builder:
               (context) => const NavBar()));
             },
             child: Container(
               height: 50,
               width: double.infinity,
               decoration: BoxDecoration(
                 color: const Color(0xffFBC700),
                 borderRadius: BorderRadius.circular(30),
               ),
               child: const Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(
                     'CREATE PORTFOLITO',
                     style: TextStyle(
                       fontSize: 16,
                       fontWeight: FontWeight.w600,
                     ),
                   ),
                   SizedBox(width: 5),
                   RotationTransition(
                     turns: AlwaysStoppedAnimation(0.85),
                     child: Icon(
                       Icons.arrow_forward
                     ),
                   ),
                 ],
               ),
             ),
           ),
         ),
        ],
      ),
    );
  }
}
