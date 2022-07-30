import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/data/models/body/product.dart';
import 'package:wantermarket/route/routes.dart';
import 'package:wantermarket/shared/app_helper.dart';

class ProductDetailsInformation extends StatelessWidget {
  const ProductDetailsInformation({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //nom du produit
          const SizedBox(height: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(product.name!, style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.black),),
              const SizedBox(height: 10,),
              RichText(text:  TextSpan(text: 'Categorie', style: const TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
                  children: [
                    const TextSpan(text: ' : ', style: TextStyle(fontWeight: FontWeight.w300, color: Colors.black)),
                    TextSpan(text: '${product.idCategorie?? 1}', style: const TextStyle(fontWeight: FontWeight.w300, color: Colors.black)),
                  ]),),
              const SizedBox(height: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (product.priceBefore != null && product.priceBefore != 0) ?Column(children: [
                    Text(AppHelper.priceFormat(price: '${product.price}'), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                    Text(AppHelper.priceFormat(price: '${product.priceBefore}'),  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.black, decoration: TextDecoration.lineThrough), )
                  ],):
                  Text(AppHelper.priceFormat(price: '${product.price}'),  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.black), ),
                ],
              ),
              const SizedBox(height: 10,),
              const Text('Description', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
              const SizedBox(height: 10,),
              Text(product.descriptionBrief!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black),),
              const SizedBox(height: 10,),
              const Text('Vendeur', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
              const SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed(AppRoutes.vendor, arguments:product.boutique!);
                },
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(product.boutique!.profilImage!),
                      radius: 20,
                    ),
                    const SizedBox(width: 10,),
                    Flexible(child: Text(product.boutique!.name!, maxLines: 3,  overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black),)),
                    const SizedBox(width: 20,),
                    const Icon(Icons.verified, color: AppColors.SECONDARY,)
                  ],
                ),
              )

            ],
          )

        ],
      ),
    );
  }
}
