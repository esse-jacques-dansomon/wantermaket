// ignore_for_file: unnecessary_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/config/app_dimenssions.dart';
import 'package:wantermarket/config/app_images.dart';
import 'package:wantermarket/data/models/body/boutique.dart';
import 'package:wantermarket/providers/boutique_favories_provider.dart';
import 'package:wantermarket/route/routes.dart';

class BoutiqueFavorite extends StatelessWidget {
  final Boutique boutique;
  const BoutiqueFavorite({
    Key? key, required this.boutique,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        AppRoutes.goTo(context, AppRoutes.vendor, arguments: boutique);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        height: 110,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipOval(
                  child: SizedBox(
                    width: 55,
                    height: 55,
                    child: CachedNetworkImage(
                      imageUrl : boutique.profilImage ?? AppImage.logo,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(boutique.name!, style: const TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 5,),
                    SizedBox(width: MediaQuery.of(context).size.width-100, child: Text(boutique.vendor!.address!, overflow: TextOverflow.ellipsis, style: const TextStyle( fontSize: AppDimensions.FONT_SIZE_DEFAULT, ), maxLines: 2,  )),
                  ],
                ),
                Expanded(child: Container()),
                //follow button

              ],
            ),
            const SizedBox(height: 10,),
            Container(
              margin: const
              EdgeInsets.only(left: 70),
              height: 35,
              width: 105,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.red,
              ),
              child: Center(
                child: TextButton(
                  // style: ButtonStyle(
                  //   backgroundColor: MaterialStateProperty.all(Colors.red),
                  // ),
                  onPressed: (){
                    Provider.of<BoutiqueFavoriesProvider>(context, listen: false).removeFavory(boutique.id!, context);
                  },
                  child: const Text('Enlever', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_DEFAULT, color: Colors.white),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
