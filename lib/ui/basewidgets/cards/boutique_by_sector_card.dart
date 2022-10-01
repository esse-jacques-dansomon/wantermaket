// ignore_for_file: unused_import

import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wantermarket/shared/contact_vendor.dart';

import '../../../config/app_images.dart';
import '../../../data/models/body/boutique.dart';
import '../../../route/routes.dart';

class BoutiqueCardBySecteur extends StatelessWidget {
  final Boutique boutique;
  const BoutiqueCardBySecteur({Key? key, required this.boutique}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: (){
        Navigator.pushNamed(context, AppRoutes.vendor, arguments: boutique);
      },
      child: Card(
        shadowColor: Colors.black,
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                // height: 70,
                width: MediaQuery.of(context).size.width/2,
                child: CachedNetworkImage(
                  fit: BoxFit.cover, imageUrl: boutique.coverImage!,
                ),

              ),
            ),
            const SizedBox(height: 10,),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 10), child: Column(
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: boutique.profilImage!,
                        fit: BoxFit.cover,
                        height: 40,
                        width: 40,
                      ),
                    ),
                    const SizedBox(width: 10,),
                     SizedBox(
                      width: 100,
                      child: Text(boutique.name!,overflow: TextOverflow.ellipsis, textAlign: TextAlign.start,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, ),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    //call button
                    IconButton(
                      icon: const Icon(Icons.call, color: Colors.blueAccent,),
                      onPressed: (){
                        ContactVendor.openPhone(context: context, number: boutique.vendor!.phone!);
                      },
                    ),

                    //whatsapp button
                    IconButton(
                      icon: const Icon(Icons.whatsapp, color: Colors.green,),
                      onPressed: (){
                        ContactVendor.openWhatsappVendor(context: context, vendor: boutique.vendor!);
                      },
                    ),

                    //gps button
                    //message button
                    IconButton(
                      icon: const Icon(Icons.location_on_outlined, color: Colors.grey,),
                      onPressed: (){
                        ContactVendor.launchMaps(boutique);
                      },
                    ),
                  ]
                )
              ],
            ),),
           ],
        ),
      ),
    );

  }
}
