import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../config/app_images.dart';
import '../../../../data/models/body/boutique.dart';
import '../../../../route/routes.dart';

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
                child: Image.network(
                  boutique.coverImage!,
                  fit: BoxFit.cover,
                ),

              ),
            ),
            const SizedBox(height: 10,),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 10), child: Column(
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Image.network(
                        boutique.profilImage!,
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
                      icon: const Icon(Icons.call, color: Colors.green,),
                      onPressed: (){},
                    ),

                    //whatsapp button
                    IconButton(
                      icon: const Icon(Icons.whatsapp, color: Colors.green,),
                      onPressed: (){},
                    ),

                    //gps button
                    //message button
                    IconButton(
                      icon: const Icon(Icons.location_on_outlined, color: Colors.grey,),
                      onPressed: (){},
                    ),
                  ]
                )
              ],
            ),),
           ],
        ),
      ),
    );
    ;
  }
}
