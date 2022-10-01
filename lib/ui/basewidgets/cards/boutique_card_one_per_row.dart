// ignore_for_file: unused_import

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wantermarket/config/app_colors.dart';

import '../../../data/models/body/boutique.dart';
import '../../../route/routes.dart';
import '../../../shared/contact_vendor.dart';

class BoutiqueCardBySecteurOnePerRow extends StatelessWidget {
  final Boutique boutique;
  const BoutiqueCardBySecteurOnePerRow({Key? key, required this.boutique}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: (){
        Navigator.pushNamed(context, AppRoutes.vendor, arguments: boutique);
      },
      child: Card(
        shadowColor: Colors.black,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment:  MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: AppColors.PRIMARY,
                // height: 80,
                width: MediaQuery.of(context).size.width/2.5,
                child: Image.network(
                  boutique.coverImage!,
                  fit: BoxFit.cover,
                ),

              ),
              SizedBox(
                width: 10,
              ),
              // const SizedBox(height: 5,),
              Expanded(
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 0), child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                          width: MediaQuery.of(context).size.width/2 - 50,
                          child: Text( boutique.name!,overflow: TextOverflow.ellipsis, textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, ),
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        //call button
                        IconButton(
                          icon: Icon(Icons.call, color: Colors.blueAccent,),
                          onPressed: (){
                            ContactVendor.openPhone(context: context, number: boutique.vendor!.phone!);
                          },
                        ),

                        //whatsapp button
                        IconButton(
                          icon: Icon(Icons.whatsapp, color: Colors.green,),
                          onPressed: (){
                            ContactVendor.openWhatsappVendor(context: context, vendor: boutique.vendor!);
                          },
                        ),

                        //gps button
                        //message button
                        IconButton(
                          icon: Icon(Icons.gps_fixed, color: Colors.grey,),
                          onPressed: (){
                            ContactVendor.launchMaps(boutique);
                          },
                        ),
                      ]
                    )
                  ],
                ),),
              ),
             ],
          ),
        ),
      ),
    );
  }
}
