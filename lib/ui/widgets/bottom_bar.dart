import 'package:flutter/material.dart';

import '../screens/home/home_screen.dart';

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
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Accueil",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: "Boutiques",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Recherche",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ]),

      body: Stack(
          children: [
            renderView(
            0,
            const HomeScreen(),
          ),
          renderView(
            1,
            const HomeScreen(),
          ),
          renderView(
            2,
            const HomeScreen(),
          ),
          renderView(
            3,
            const HomeScreen(),
          ),
          
          ]
      ),
    );
  }
   Widget renderView(int tabIndex, Widget view) {
    return IgnorePointer(
      ignoring: _currentIndex != tabIndex,
      child: Opacity(
        opacity: _currentIndex == tabIndex ? 1 : 0,
        child: view,
      ),
    );
  }
}