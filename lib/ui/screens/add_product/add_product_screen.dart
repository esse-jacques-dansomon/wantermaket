import 'package:flutter/material.dart';
import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/config/app_dimenssions.dart';
import 'package:wantermarket/ui/screens/add_product/widgets/product_form.dart';

import '../../basewidgets/app_bars/app_bar.dart';
import '../../basewidgets/app_bars/drawer.dart';
import '../../basewidgets/bottom_bar/bottom_nav_bar.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      bottomNavigationBar: const CustomBottomNavBar(add_product: true,),
      appBar: appBar(isActiveSearchbar:true),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        physics:  const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 20,),
              Text("Ajouter Un Produit", textAlign: TextAlign.start, style: TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE, color: AppColors.BLACK),),
              SizedBox(height: 10,),
              ProductAddForm(),
            ]
          ),
        ),
      ),
    ));
  }
}
