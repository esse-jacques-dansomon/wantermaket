import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../route/routes.dart';

class BoutiqueCardBySecteur extends StatelessWidget {
  const BoutiqueCardBySecteur({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: (){
        Navigator.pushNamed(context, AppRoutes.vendor);
      },
      child: Card(
        shadowColor: Colors.black,
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                // height: 70,
                width: MediaQuery.of(context).size.width/2,
                child: Image.network(
                  'https://picsum.photos/250?image=${2*11}',
                  fit: BoxFit.cover,
                ),

              ),
            ),
            const SizedBox(height: 10,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: Column(
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
                   const  SizedBox(
                      width: 100,
                      child: Text('Boutique de pretes porter Ama',overflow: TextOverflow.ellipsis, textAlign: TextAlign.start,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, ),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
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
