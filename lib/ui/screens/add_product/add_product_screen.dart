import 'package:flutter/material.dart';
import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/config/app_dimenssions.dart';
import 'package:wantermarket/ui/screens/add_product/widgets/product_form.dart';

import '../../../data/models/body/product.dart';
import '../../basewidgets/app_bars/app_bar_with_return.dart';
import '../../basewidgets/app_bars/drawer.dart';
import '../../basewidgets/bottom_bar/bottom_nav_bar.dart';

class AddProductScreen extends StatelessWidget {
  final Product? product;
  const AddProductScreen({Key? key,  this.product}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBar(add_product: true,),
      appBar: appBarWithReturn(title: product?.id != null ? "Modifier ${product!.name!}" : 'Ajouter un produit', context: context),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics:  const BouncingScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const SizedBox(height: 20,),
                const Text("Ajouter Un Produit", textAlign: TextAlign.start, style:  TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE+3, color: AppColors.BLACK),),
                const SizedBox(height: 10,),
                product?.id != null ? ProductAddForm(product: product,) : const ProductAddForm(),
                const SizedBox(height: 30,),

              ]
            ),
          ),
        ),
      ),
    );
  }
}
