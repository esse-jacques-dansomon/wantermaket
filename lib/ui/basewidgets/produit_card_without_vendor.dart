import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../config/app_colors.dart';
import '../screens/produit/produit_details_screen.dart';

class ProduitCardWithoutVendor extends StatelessWidget {
  const ProduitCardWithoutVendor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        // Navigator.push(context, MaterialPageRoute(builder: (context) => ProduitDetailsScreen()));
      },
      child: Card(
        child: SizedBox(
          width: 170,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 200,
                    width: 190,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://picsum.photos/250?image=9',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    //promotion
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          width: 70,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomRight: Radius.circular(10)),
                            color: Colors.red,
                          ),
                          child: Center(child: const Text('-10% OFF', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),),),
                        ),
                        //like

                         ],
                    ),
                  ),
                  Positioned(bottom: -15, right: 10,child: Container(
                    width: 35,
                    height: 35,
                    color: Colors.transparent,
                    child: Center(
                      child: IconButton( onPressed: (){},
                          icon: Icon(Icons.favorite_border, color: Colors.red, size: 25,)),
                    ),
                  ),),
                ],
              ),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:  [
                    const SizedBox(height: 10,),
                      Text( toBeginningOfSentenceCase("mack book pro 2017, avec touche bar, vennant de usa 2017, en bon etat").toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,

                        style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w400,


                        ),),
                      const SizedBox(height: 5,),
                      Text('fcf 5000 0000'.toUpperCase(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),

                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        width: 170,
                        child: Row(
                          children: [
                             Expanded(
                                 child: Text('Boumba Ba SY boutique', maxLines: 1, overflow: TextOverflow.ellipsis,  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.PRIMARY),)),
                            Icon(Icons.verified, color: AppColors.SECONDARY,)
                          ],
                        ),
                      )

                    ],
                  )
              ),


            ],
          ),
        ),
      ),
    )
    ;
  }
}
