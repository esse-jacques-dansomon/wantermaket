import 'package:flutter/material.dart';
import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/shared/app_helper.dart';

import '../../config/app_dimenssions.dart';
import '../../route/routes.dart';

class ProductByBoutique2 extends StatelessWidget {
  final int id;
  const ProductByBoutique2({Key? key, required this.id}) : super(key: key);

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
                child: Container(
                  // height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image:  DecorationImage(
                      image: NetworkImage(
                        'https://picsum.photos/250?image=$id',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Mac Book Pro Mac Mac Book Pro Mac mac Book Pro Mac', maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black, ),),
                    SizedBox(height: 5),
                    Text(AppHelper.priceFormat(price: '200000'.toString()), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.SECONDARY),),
                    // contact button
                    SizedBox(height: 5),
                    SizedBox(height: 25, child: ElevatedButton(
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
                                    height: 35,
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
                          backgroundColor: MaterialStateProperty.all(AppColors.SECONDARY),
                        ),
                        child: Text('Contactez le vendeur', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_SMALL+0.5), textAlign: TextAlign.left, ))),

                    InkWell(
                      onTap: (){},
                      child: ListTile(
                        horizontalTitleGap: 10,
                        contentPadding: const EdgeInsets.only(right: 15),
                        leading:  SizedBox(
                          height: 35,
                          child: ClipOval(
                            child: Image.network(
                              'https://picsum.photos/250?image=9',
                              fit: BoxFit.cover,
                            ),),
                        ),
                        trailing:  Icon(Icons.verified, color: AppColors.SECONDARY,),
                        title: const Text('Boumba Ba SY boutique',  maxLines: 2,style: TextStyle(fontSize: 14,  fontWeight: FontWeight.bold, color: AppColors.PRIMARY),),
                      ),
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
