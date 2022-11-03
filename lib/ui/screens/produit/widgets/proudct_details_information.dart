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
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //nom du produit
          const SizedBox(height: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(product.name!, style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.black),),
              const SizedBox(height: 15,),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (product.priceBefore != null && product.priceBefore != 0) ?Column(children: [
                    Text(AppHelper.priceFormat(price: '${product.price}'), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.PRIMARY),),
                    const SizedBox(height: 7,),
                    Text(AppHelper.priceFormat(price: '${product.priceBefore}'),  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.black, decoration: TextDecoration.lineThrough), )
                  ],):
                  Text(AppHelper.priceFormat(price: '${product.price}'),  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.black), ),
                ],
              ),
              const SizedBox(height: 15,),
              const Text('Description', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
              const SizedBox(height: 6,),
              Text(product.descriptionBrief!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black),),
              const SizedBox(height: 15,),
              const Text('Vendeur', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
              const SizedBox(height: 6,),
              InkWell(
                onTap: (){
                  AppRoutes.goTo(context, AppRoutes.vendor, arguments:product.boutique!);
                },
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(product.boutique!.profilImage!),
                      radius: 20,
                    ),
                    const SizedBox(width: 12,),
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
