import 'package:flutter/material.dart';
import 'package:wantermarket/config/app_colors.dart';

import '../screens/boutique/secteur_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/recherche/search_screen.dart';
import 'app_bar.dart';

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
      bottomNavigationBar:  BottomNavigationBar(
        currentIndex: _currentIndex,
        unselectedIconTheme: const IconThemeData(color: AppColors.PRIMARY),
        selectedIconTheme: const IconThemeData(color: AppColors.SECONDARY),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.PRIMARY,
        ),
          selectedLabelStyle: const TextStyle(
          fontSize: 13.5,
          fontWeight: FontWeight.w300,
          color: AppColors.SECONDARY,
        ),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30,),
            label: "Accueil",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop, size: 30, ),
            label: "Boutiques",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 30,),
            label: "Recherche",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30,),
            label: "Profile",
          ),
        ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        elevation: 50,
        backgroundColor: AppColors.PRIMARY,
      ),
      appBar: appBar(),
      drawer: newDrawer(MediaQuery.of(context).size.height),
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
        return const SecteurScreen();
      default:
        return const HomeScreen();
    }
  }
}