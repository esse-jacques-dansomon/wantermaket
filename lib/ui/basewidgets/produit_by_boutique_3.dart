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
                    Positioned(top: 5, right: 5,child: Container(
                      decoration:  BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(2)),
                        color: Colors.grey[200],
                      ),
                        padding: const EdgeInsets.all(2),
                        child: const Icon(Icons.favorite_border_outlined, color: Colors.blueAccent,)),),
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
                    const SizedBox(height: 5),
                    Text('Article qui tient sur plusieurs liges par exemple ${MediaQuery.of(context).size.width}',  maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),),
                    // contact button
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            //localisation icon
                            Icon(Icons.location_on_outlined, color: AppColors.BLACK, size: 14, ),
                            SizedBox(width: 5,),
                            Text('Dakar, Senegal', style: TextStyle(fontSize: 10, color: Colors.black, ),),
                          ],
                        ) ,
                        const SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:  [
                            //localisation icon
                            const Icon(Icons.person_outline_outlined, color: AppColors.BLACK, size: 14,),
                            const SizedBox(width: 5,),
                            InkWell
                              (
                                onTap: (){
                                  Navigator.of(context).pushNamed(AppRoutes.vendor);
                                },
                                child: const Text('Bamba Ndiaye', style: TextStyle(fontSize: 10, color: Colors.black, ),)),
                          ],
                        )

                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              showDialog(
                                context: context,
                                builder: (context) => const ContactsDialog(),
                              );
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.SECONDARY, width: 1),
                                ),
                                height: 25, child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.phone, color: AppColors.SECONDARY, size: 15,),
                                    SizedBox(width: 5,),
                                    Text('Contacts le vendeur', overflow: TextOverflow.ellipsis, style: TextStyle( color: AppColors.SECONDARY ,fontSize: AppDimensions.FONT_SIZE_EXTRA_SMALL-1), textAlign: TextAlign.left, ),
                                  ],
                                )),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          height: 25,
                          color: Colors.grey[200],
                          child: const Center(
                            child: Icon(Icons.verified, color: AppColors.SECONDARY, size: 18,),
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

class ContactsDialog extends StatelessWidget {
  const ContactsDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Contactez le vendeur via: ', textAlign: TextAlign.start,),
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
              mainAxisAlignment: MainAxisAlignment.center,
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
            height: 40,
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
    );
  }
}
