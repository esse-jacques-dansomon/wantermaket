import 'package:flutter/material.dart';
import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/shared/app_helper.dart';

import '../../config/app_dimenssions.dart';
import '../../route/routes.dart';

class ProductByBoutique3 extends StatelessWidget {
  final int id;
  const ProductByBoutique3({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.product, arguments: id);
      },
      child: Card(
        child: SizedBox(
          width: 230,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      // height: 200,
                      decoration: BoxDecoration(
                        image:  DecorationImage(
                          image: NetworkImage(
                            'https://picsum.photos/250?image=$id',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                        color: Colors.grey[200],
                      ),
                        padding: const EdgeInsets.all(2),
                        child: Icon(Icons.favorite_border_outlined, color: Colors.blueAccent,)), top: 5, right: 5,),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 5.0, bottom: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(AppHelper.priceFormat(price: '200000'.toString()), style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.SECONDARY),),
                    SizedBox(height: 5),
                    Text('Article qui tient sur plusieurs liges par exemple',  maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),),
                    // contact button
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            //localisation icon
                            Icon(Icons.location_on_outlined, color: AppColors.BLACK, size: 14, ),
                            SizedBox(width: 5,),
                            Text('Dakar, Senegal', style: TextStyle(fontSize: 10, color: Colors.black, ),),
                          ],
                        ) ,
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //localisation icon
                            Icon(Icons.person_outline_outlined, color: AppColors.BLACK, size: 14,),
                            SizedBox(width: 5,),
                            Text('Bamba Ndiaye', style: const TextStyle(fontSize: 10, color: Colors.black, ),),
                          ],
                        )

                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.SECONDARY, width: 1),
                            ),
                            height: 25, child: ElevatedButton(
                            onPressed: (){
                              //show dialog
                              showDialog(

                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Contactez le vendeur via: ', textAlign: TextAlign.start,),
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        height: 35,
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all(Colors.black54),
                                                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50),
                                                ),)
                                            ),
                                            onPressed: (){}, child: Row(
                                          children: [
                                            const Icon(Icons.call_outlined, size: 25),
                                          ],
                                        )),
                                      ),
                                      SizedBox(
                                        height: 40,
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all(Colors.black54),
                                                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50),
                                                ),)
                                            ),
                                            onPressed: (){}, child: Row(
                                          children: [
                                            const Icon(Icons.sms_outlined, size: 25),
                                          ],
                                        )),
                                      ),
                                      SizedBox(
                                        height: 25,
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all(Colors.green),
                                                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50),
                                                ),)
                                            ),
                                            onPressed: (){}, child: Row(
                                          children: [
                                            const Icon(Icons.whatsapp, size: 25),
                                          ],
                                        )),
                                      ),
                                      //message
                                    ],
                                  ),
                                  actions: [

                                  ],
                                ),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(AppColors.WHITE),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Icon(Icons.phone, color: AppColors.SECONDARY, size: 15,),
                                Text('Contactez le vendeur', style: TextStyle( color: AppColors.SECONDARY ,fontSize: AppDimensions.FONT_SIZE_EXTRA_SMALL-1), textAlign: TextAlign.left, ),
                              ],
                            ))),
                        Expanded(
                          child: Container(
                            height: 25,
                            color: Colors.grey[200],
                            child: const Center(
                              child: Icon(Icons.verified, color: AppColors.SECONDARY, size: 18,),
                            ),
                          ),
                        )
                      ],
                    ),

                  ],
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
