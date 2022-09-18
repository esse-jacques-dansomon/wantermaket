import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/providers/product_provider.dart';
import 'package:wantermarket/shared/app_helper.dart';
import 'package:wantermarket/ui/basewidgets/shimmer/shimmer_product.dart';

import '../../../basewidgets/cards/produit_by_boutique.dart';

class NouveautesWidget extends StatelessWidget {
  const NouveautesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.only(left: 15.0, top: 25,right: 10),
          child:Text('Nouveautés', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, ), textAlign: TextAlign.start,),
        ),
        const SizedBox(height: 10,),
        Consumer<ProductProvider>(builder:(context, productProvider, child){
         switch(productProvider.newArrivalStatus){
           case ProductNewArrivalStatus.initial:
             return GridView.builder(
                 itemCount: 6,
                 padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                 physics: const NeverScrollableScrollPhysics(),
                 shrinkWrap: true,
                 gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                   //dynamic
                     crossAxisCount: AppHelper.getCrossAxisCount(context, width: 230),
                     mainAxisSpacing: 10,
                     mainAxisExtent: 320,
                     childAspectRatio: 1.5
                 ),
                 itemBuilder: (context, index){
                   return ProductShimmer();
                 });
           case ProductNewArrivalStatus.loading:
           case ProductNewArrivalStatus.loaded:
             return productProvider.newArrivals.length > 0 ? GridView.builder(
                 itemCount: productProvider.newArrivals.length,
                 padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                 physics: const NeverScrollableScrollPhysics(),
                 shrinkWrap: true,
                 gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                   //dynamic
                     crossAxisCount: AppHelper.getCrossAxisCount(context, width: 230),
                     mainAxisSpacing: 10,
                     mainAxisExtent: 320,
                     childAspectRatio: 1.5
                 ),
                 itemBuilder: (context, index){
                   return ProductByBoutique(product: productProvider.newArrivals[index] ,);
                 }): const Center(child: Text('Aucun produit trouvé'),);
           case ProductNewArrivalStatus.error:
             return const Center(child: Text('Erreur de chargement'),);
         }
        } ),
        const SizedBox(height: 15,),
      ],
    );
  }
}
