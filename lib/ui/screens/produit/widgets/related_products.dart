import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/providers/product_provider.dart';
import 'package:wantermarket/ui/basewidgets/cards/produit_by_boutique.dart';

class RelatedProducts extends StatelessWidget {
  const RelatedProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const SizedBox(height: 15,),
            const Text('Produits Similaires : ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
            const SizedBox(height: 15,),
            SizedBox(
              height: 250,
              child:  Consumer<ProductProvider>(
                builder: (ctx, productProvider, child){
                  return ListView.separated(
                      itemCount: productProvider.relatedProducts.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => const SizedBox(width: 20,),
                      itemBuilder: (context, index){
                        return  SizedBox(width: 200, child: ProductByBoutique(product: productProvider.relatedProducts[index], isRelated: true,));
                      }
                  );
                },
              ),
            ),
            const SizedBox(height: 10,),

          ]),
    );
  }
}
