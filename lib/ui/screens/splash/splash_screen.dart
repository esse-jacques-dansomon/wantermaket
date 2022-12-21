import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/providers/location_provider.dart';

import '../../../providers/auth_provider.dart';
import '../../../providers/boutique_provider.dart';
import '../../../providers/category_provider.dart';
import '../../../providers/product_provider.dart';
import '../../../providers/signaler_provider.dart';
import '../../../providers/slider_provider.dart';
import '../../../route/routes.dart';

class SlashScreen extends StatefulWidget {
  const SlashScreen({Key? key}) : super(key: key);

  @override
  State<SlashScreen> createState() => _SlashScreenState();
}



class _SlashScreenState extends State<SlashScreen> {

  late Timer timer;

  @override
  initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LocalizationProvider>(context, listen: false).getAllCountries(context);
      Provider.of<SliderProvider>(context, listen: false).getHomeSliders(context);
      Provider.of<BoutiqueProvider>(context, listen: false).getBoutiquesExclusives(context);
      Provider.of<BoutiqueProvider>(context, listen: false).getTopBoutiques(context);
      Provider.of<CategoryProvider>(context, listen: false).getCategories(context);
      Provider.of<ProductProvider>(context, listen: false).getTopAnnonces(context);
      Provider.of<ProductProvider>(context, listen: false).getDealOfTheDay(context);
      Provider.of<ProductProvider>(context, listen: false).getNewArrivals(context, reload: true);
      Provider.of<SignalerProvider>(context, listen: false).getRaisons(context, "produit");
      Provider.of<SignalerProvider>(context, listen: false).getRaisons(context, "vendeur");
      timer = Timer(const Duration(milliseconds: 4000), () {
        //navigate to the next screen
        Navigator.pushReplacementNamed(context, AppRoutes.home);
        Provider.of<AuthProvider>(context, listen: false).verifyIsAuthenticated(context);
      });
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Center(
                    child: Image.asset('assets/images/logo.png', width: 150, height: 150),
                  ),
                ),
                const SizedBox(height: 5),
                const Text("Wanter Market", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                const SizedBox(height: 20),
              ],
            ),
          ),

          Container( padding : EdgeInsets.only(bottom: 25),  child: Text("Developped by Agence Cauris", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),)),
          //spinner with animation
        ],
      ),
    );
  }
}
