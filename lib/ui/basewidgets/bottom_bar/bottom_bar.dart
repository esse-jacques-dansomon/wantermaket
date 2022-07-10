import 'package:flutter/material.dart';
import 'package:wantermarket/config/app_colors.dart';

import '../../screens/auth/start_screen.dart';
import '../../screens/sector/secteur_screen.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/mon_compte/dashboard_screen.dart';
import '../../screens/recherche/search_screen.dart';
import '../app_bars/app_bar.dart';
import 'bottom_nav_bar.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
 int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomAppBar(
      //   shape : const CircularNotchedRectangle(),
      //       child: BottomNavigationBar(
      //     currentIndex: _currentIndex,
      //     unselectedIconTheme: const IconThemeData(color: AppColors.PRIMARY),
      //     selectedIconTheme: const IconThemeData(color: AppColors.SECONDARY),
      //     unselectedLabelStyle: const TextStyle(
      //       fontSize: 12,
      //       fontWeight: FontWeight.w400,
      //       color: AppColors.PRIMARY,
      //     ),
      //     selectedLabelStyle: const TextStyle(
      //       fontSize: 13.5,
      //       fontWeight: FontWeight.w300,
      //       color: AppColors.SECONDARY,
      //     ),
      //     onTap: (index) {
      //       setState(() {
      //         _currentIndex = index;
      //       });
      //     },
      //     items:  [
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.home, size: 30,),
      //         label: "Accueil",
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.shop, size: 30, ),
      //         label: "Boutiques",
      //       ),
      //
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.search, size: 30,),
      //         label: "Recherche",
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.person, size: 30,),
      //         label: "Profile",
      //       ),
      //     ]),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => LoginOrLogupScreen()),
      //     );
      //   },
      //   isExtended: true,
      //   label: const Text(""),
      //   icon: const Icon(Icons.ads_click),
      //   extendedTextStyle: const TextStyle(
      //     fontSize: 16,
      //     fontWeight: FontWeight.w400,
      //     color: AppColors.PRIMARY,
      //   ),
      //   elevation: 50,
      //   backgroundColor: AppColors.PRIMARY,
      // ),
      endDrawer: newDrawer(MediaQuery.of(context).size.height),
      body: renderView(_currentIndex) ,
    );
  }
   Widget renderView(int tabIndex) {
    switch(tabIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const SecteurScreen();
      case 2:
        return const SearchScreen();
      case 3:
        return  DashBoardScreen();
      default:
        return const HomeScreen();
    }
  }
}