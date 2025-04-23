import 'package:crypto_app/assets/app_icons.dart';
import 'package:crypto_app/pages/home/home_screen.dart';
import 'package:crypto_app/pages/profile/profile_srceen.dart';
import 'package:flutter/material.dart';


class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {


  int currentIndex = 0;

  List<Widget> pages = [
     const HomeScreen(),
     HomeScreen(),
     HomeScreen(),
     const ProfileSrceen(),

  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: pages.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: const Color(0xffFBC700),
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(AppIcons.home,height: size.height * 0.03,),label: '',
              activeIcon: Image.asset(AppIcons.homeFill,height: size.height * 0.03,
              color: const Color(0xffFBC700),)),
            BottomNavigationBarItem(
                icon: Image.asset(AppIcons.explore,height: size.height * 0.03,),label: '',
                activeIcon: Image.asset(AppIcons.exploreFill,height: size.height * 0.03,
                  color: const Color(0xffFBC700),)),
            BottomNavigationBarItem(
                icon: Image.asset(AppIcons.noti,height: size.height * 0.03,),label: '',
                activeIcon: Image.asset(AppIcons.notiFill,height: size.height * 0.03,
                  color: const Color(0xffFBC700),)),
            BottomNavigationBarItem(
                icon: Image.asset(AppIcons.profile,height: size.height * 0.03,),label: '',
                activeIcon: Image.asset(AppIcons.profileFill,height: size.height * 0.03,
                  color: const Color(0xffFBC700),)),
          ]),
    );
  }
}
