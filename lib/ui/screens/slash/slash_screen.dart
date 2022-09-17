import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/providers/location_provider.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_images.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/boutique_provider.dart';
import '../../../providers/category_provider.dart';
import '../../../providers/product_provider.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AuthProvider>(context, listen: false).verifyIsAuthenticated();
      Provider.of<LocalizationProvider>(context, listen: false).getAllCountries();
      Provider.of<SliderProvider>(context, listen: false).getHomeSliders();
      Provider.of<BoutiqueProvider>(context, listen: false).getTopBoutiques();
      Provider.of<CategoryProvider>(context, listen: false).getCategories();
      Provider.of<ProductProvider>(context, listen: false).getTopAnnonces();
      Provider.of<ProductProvider>(context, listen: false).getTopAnnonces();
      Provider.of<ProductProvider>(context, listen: false).getDealOfTheDay();
      Provider.of<ProductProvider>(context, listen: false).getNewArrivals();
      timer = Timer(const Duration(milliseconds: 4000), () {
        //navigate to the next screen
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      });
    });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/images/logo.png', width: 150, height: 150),
          ),
          const SizedBox(height: 5),
          const Text("WanterMarket", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          const SizedBox(height: 20),
          //spinner with animation
        ],
      ),
    );
  }
}
