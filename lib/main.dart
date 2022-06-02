import 'package:flutter/material.dart';
import 'package:wantermarket/ui/screens/home/home_screen.dart';


import 'ui/widgets/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WANTERMARKET',
      theme: ThemeData(      
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(
            fontSize: 12,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 12,
          ),
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black45,       
         
        ),
      ),
      home: const SafeArea(
        child: Scaffold(
          body: HomeScreen() ,
          bottomNavigationBar: BottomBar(),
        ),
      )
    );
  }
}

