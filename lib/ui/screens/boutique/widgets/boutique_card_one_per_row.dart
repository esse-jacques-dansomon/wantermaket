import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wantermarket/config/app_colors.dart';

import '../../../../route/routes.dart';

class BoutiqueCardBySecteurOnePerRow extends StatelessWidget {
  const BoutiqueCardBySecteurOnePerRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: (){
        Navigator.pushNamed(context, AppRoutes.vendor);
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
                  'https://picsum.photos/250?image=${2*11}',
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
                            'https://picsum.photos/250?image=${2*11}',
                            fit: BoxFit.cover,
                            height: 40,
                            width: 40,
                          ),
                        ),
                        const SizedBox(width: 10,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width/2 - 50,
                          child: Text('Boutique 1Ligne de pretes',overflow: TextOverflow.ellipsis, textAlign: TextAlign.start,
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
                          icon: Icon(Icons.call, color: Colors.green,),
                          onPressed: (){},
                        ),

                        //whatsapp button
                        IconButton(
                          icon: Icon(Icons.whatsapp, color: Colors.green,),
                          onPressed: (){},
                        ),

                        //gps button
                        //message button
                        IconButton(
                          icon: Icon(Icons.gps_fixed, color: Colors.grey,),
                          onPressed: (){},
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
    ;
  }
}
