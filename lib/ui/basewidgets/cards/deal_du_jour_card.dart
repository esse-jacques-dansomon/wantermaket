import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/route/routes.dart';
import 'package:wantermarket/shared/app_helper.dart';

import '../../../data/models/body/product.dart';


class DealDuJour extends StatelessWidget {
  final Product product;
  const DealDuJour({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.product, arguments: product);

      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width*0.9,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image:  DecorationImage(
                      image: CachedNetworkImageProvider(
                        product.images![0].path.replaceAll('\r\n', ''),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 30,
                              width: 150,
                              decoration: BoxDecoration(
                                color: AppColors.SECONDARY,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Center(
                                child: Text('En Promo -10%', textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children:  [
                  Padding(padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                    child: Text(
                      '${product.name}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style:const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),),
                  Padding(padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      AppHelper.priceFormat(price: '${product.price ?? product.priceBefore}'),
                      style: const TextStyle(
                        fontSize: 20,
                        color: AppColors.SECONDARY,
                        fontWeight: FontWeight.bold,
                      ),
                    ),),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all( AppColors.SECONDARY),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: (){
                            Navigator.pushNamed(context, AppRoutes.product, arguments: product);
                    },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width*0.90,
                        child: const Center(
                          child: Text('Profitez-en !', style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                          ),
                        ),
                      ),
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
