import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../screens/produit/produit_details_screen.dart';

class ProduitCardWithoutVendor extends StatelessWidget {
  const ProduitCardWithoutVendor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProduitDetailsScreen()));
      },
      child: Card(
        child: SizedBox(
          width: 170,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 170,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                  ],
                ),
              ),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:  [
                      const SizedBox(height: 10,),
                      Text( toBeginningOfSentenceCase("mack book pro 2017, avec touche bar, vennant de usa 2017, en bon etat").toString(),

                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,

                        style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w400,


                        ),),
                      const SizedBox(height: 5,),
                      const Text('5000 0000 fcfa', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Icon(Icons.star, size: 18, color: Colors.yellow,),
                          Icon(Icons.star, size: 18, color: Colors.yellow,),
                          Icon(Icons.star, size: 18, color: Colors.yellow,),
                          Icon(Icons.star, size: 18, color: Colors.yellow,),
                          Icon(Icons.star_half, size: 18, color: Colors.yellow,),
                        ],
                      ),
                      const SizedBox(height: 15,),

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
