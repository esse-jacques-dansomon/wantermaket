import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_images.dart';
import '../../../data/models/body/product.dart';
import '../../../providers/crud_product_provider.dart';
import '../../../providers/vendor_provider.dart';
import '../../../route/routes.dart';
import '../../../shared/app_helper.dart';

class VendorProductCard2 extends StatelessWidget {
  final Product product;
  const VendorProductCard2({
    Key? key, required this.product
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, AppRoutes.product, arguments: product);
      },
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 130,
              height: 150,
              child: CachedNetworkImage(
                imageUrl:  product.images!.isNotEmpty ? product.images![0].path : AppImage.logo,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Image.network(AppImage.logo),
              ),
            ),
            SizedBox(width: 10,),
            Expanded(child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(product.name!,maxLines: 1,overflow: TextOverflow.ellipsis,  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text("250000 FCFA", maxLines: 1, overflow: TextOverflow.ellipsis,),
                  SizedBox(height: 10,),
                  Text("Telephonene", maxLines: 1, overflow: TextOverflow.ellipsis,),
                  SizedBox(height: 7,),
                  Text("Categorie", maxLines: 1, overflow: TextOverflow.ellipsis,),
                  SizedBox(height: 5,),
                  Row(
                      children: [
                        InkWell(onTap: (){}, child: Container(padding: EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10), decoration: BoxDecoration(
                            color: AppColors.PRIMARY,
                            borderRadius: BorderRadius.circular(10)
                        ), child: const Text("Booster", style: TextStyle(color: Colors.white, fontSize: 16),))),
                        SizedBox(width: 10,),
                        InkWell(onTap: (){}, child: Container(padding: EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10), decoration: BoxDecoration(
                            color: AppColors.PRIMARY,
                            borderRadius: BorderRadius.circular(10)
                        ), child: const Text("Booster", style: TextStyle(color: Colors.white, fontSize: 16),))),

                      ]
                  )
                ],
              ),
            )),
            Expanded(child: Column(
              children: [
                InkWell(onTap: (){}, child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: AppColors.PRIMARY,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Icon(Icons.edit, color: Colors.white,))),
                SizedBox(height: 10,),
                InkWell(onTap: (){}, child: const Icon(Icons.restore_from_trash)),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
