import 'package:flutter/material.dart';
import '../../screens/sector/sector_screen.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/dashboard/dashboard_screen.dart';
import '../../screens/recherche/search_screen.dart';
import '../app_bars/app_bar.dart';

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
        return  const DashBoardScreen();
      default:
        return const HomeScreen();
    }
  }
}