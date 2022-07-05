import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/providers/boutique_provider.dart';
import 'package:wantermarket/providers/category_provider.dart';
import 'package:wantermarket/providers/product_provider.dart';
import 'package:wantermarket/providers/slider_provider.dart';
import 'package:wantermarket/route/routes.dart';
import 'package:wantermarket/ui/screens/home/home_screen.dart';
import './dependance_injector/dependance_injector.dart' as di;



// void main() {
//   runApp(MultiProvider(
//     providers: [
//       ChangeNotifierProvider(create: (_) => sl),
//     ],
//     child: const MyApp(),),);
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
    runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => di.sl<SliderProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<BoutiqueProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<CategoryProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ProductProvider>()),
    ],
    child: const MyApp(),),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        title: 'WANTERMARKET',
        theme: buildThemeData(),
        home: const SafeArea(
          child: Scaffold(
            body: HomeScreen(),
          ),
        )
    );
  }

  ThemeData buildThemeData() {
    return ThemeData(
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
    );
  }
}

