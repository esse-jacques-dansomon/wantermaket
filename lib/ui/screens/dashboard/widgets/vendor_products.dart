import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/ui/basewidgets/cards/vendor_product_card_v2.dart';

import '../../../../providers/vendor_provider.dart';
import '../../../../shared/app_helper.dart';
import '../../../basewidgets/cards/vendor_product_card.dart';

class VendorDashboardProducts extends StatelessWidget {
  const VendorDashboardProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin : const EdgeInsets.only(bottom: 20, top: 10),
          child: Row(
              children:  [
                Expanded(child:  Divider(color: Colors.grey,),),
                Container( padding: const EdgeInsets.symmetric(horizontal: 10), child: const Text('Mes Produits', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
                Expanded(child: Divider(color: Colors.grey,),),
              ]
          ),
        ),
        Consumer<VendorProvider>(
          builder: (context, vendorProvider, _){
            return vendorProvider.products.isNotEmpty ? GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: AppHelper.getCrossAxisCount(context, width: 230),
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 320
                ),
                itemCount: vendorProvider.products.length,
                itemBuilder : (context, index){
                  return VendorProductCard(product: vendorProvider.products[index],);
                }
            ) : Container(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: const Center(child: Text('Aucun Produit', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
            );
          },
        ),
      ],
    );
  }
}
