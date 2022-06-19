import 'package:flutter/material.dart';
import 'package:wantermarket/config/app_colors.dart';

import 'package:intl/intl.dart';

import '../../basewidgets/produit_by_boutique_2.dart';
import '../../basewidgets/produit_card_without_vendor.dart';

class BoutiqueDetailsScreen extends StatelessWidget {
  const BoutiqueDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        title: const Text('Boutique AMAMA', style: TextStyle(color: Colors.black),),
        iconTheme: const IconThemeData(color: Colors.black, size: 28),),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //seller informations
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://picsum.photos/250?image=9',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Card(
                child: SizedBox(
                  height: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 15,),
                      ClipOval(
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: const DecorationImage(
                              image: NetworkImage(
                                'https://picsum.photos/250?image=9',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Maktoum Shop', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                          const SizedBox(height: 5,),
                          Row(
                            children: const [
                              Icon(Icons.location_on, size: 18,color: AppColors.SECONDARY,),
                              SizedBox(width: 5,),
                              Text('Bab Ezzouar, Algiers', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                            ],
                          ),
                          const SizedBox(height: 5,),
                          Row(
                            children: const [
                              Icon(Icons.category, size: 18,color : AppColors.SECONDARY),
                              SizedBox(width: 5,),
                              Text('Prêtes à porter', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                            ],
                          ),
                          const SizedBox(height: 5,),
                          Row(
                            children: const [
                              Icon(Icons.shop_two_rounded, size: 18,color: AppColors.SECONDARY,),
                              SizedBox(width: 5,),
                              Text('10 produits', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                            ],
                          ),
                          //follow button
                          const SizedBox(height: 5,),
                        ],
                      )),
                      const SizedBox(width: 5),
                    ],
                  ),
                ),
              ),
              //buttons
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Expanded(
                   child: ElevatedButton(
                     onPressed: () {},
                     style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(AppColors.PRIMARY)
                     ),
                     child: const Text('Suivre', style: TextStyle(color: Colors.white, fontSize: 18),),
                   ),
                 ),
                 SizedBox(width: 10,),
                 Expanded(
                   child: ElevatedButton(
                     onPressed: () {
                       showModalBottomSheet(
                         constraints:  BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.5),
                         isScrollControlled: true,
                           context: context, builder: (context) => FicheVendeur());
                     },
                     style: ButtonStyle(
                         backgroundColor: MaterialStateProperty.all(AppColors.PRIMARY)
                     ),
                     child: const Text('Infos', style: TextStyle(color: Colors.white, fontSize: 18),),
                   ),
                 ),
                 SizedBox(width: 10,),
                 Expanded(
                   child: ElevatedButton(
                     onPressed: () {
                       showModalBottomSheet(
                           constraints:  BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.5),
                           isScrollControlled: true,
                           context: context, builder: (context) => FicheVendeur());
                     },
                     style: ButtonStyle(
                         backgroundColor: MaterialStateProperty.all(AppColors.WHITE)
                     ),
                     child: const Text('Partager', style: TextStyle(color: AppColors.PRIMARY, fontSize: 18),),
                   ),
                 ),
               ],
              ),
              const SizedBox(height: 15,),
              //search input  + button
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[200],

                ),
                child: Row(
                  children: const [
                    SizedBox(width: 15,),
                    Expanded(child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Rechercher',
                        hintStyle: const TextStyle(color: Colors.black),
                      ),
                    ),),
                    const SizedBox(width: 15,),
                    Icon(Icons.search, size: 25, color: Colors.black,),
                    const SizedBox(width: 15,),
                  ],
                ),
              ),

              //seller products
              const SizedBox(height: 15,),
              Text('Produits', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              const SizedBox(height: 10,),
              GridView.builder(
                itemCount: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 315),
                  itemBuilder: (context, index){
                    return ProductByBoutique2(id: index);
                  }),


              const SizedBox(height: 25,),

            ],
          ),
        ),
      ),
    ));
  }
}

class FicheVendeur extends StatelessWidget {
  const FicheVendeur({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height*0.7,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Maktoum Shop', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                InkWell(child: Icon(Icons.close, size: 28, color: AppColors.SECONDARY,),
                  onTap: (){
                    Navigator.pop(context);
                  },),
              ],
            ),
            const SizedBox(height: 10,),
            Text('Biographie', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            Text('Maktoum Shop est une boutique de vente au détail et en gros spécialisée dans les secteurs suivants: agro-alimentaire, électronique, beauté,... La qualité de nos produits est au cœur de nos activités.', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
            const SizedBox(height: 10,),
            //Nom vendeur
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nom vendeur', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                const SizedBox(height: 5,),
                Text('Pikani', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
              ],
            ),
            const SizedBox(height: 10,),

            //horaires
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Coordonnees', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                const SizedBox(height: 5,),
                Row(
                  children: const [
                    Icon(Icons.location_on, size: 18,),
                    SizedBox(width: 5,),
                    Text('Bab Ezzouar, Algiers', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  children: const [
                    Icon(Icons.phone, size: 18,),
                    SizedBox(width: 5,),
                    Text('+213 554 554 554', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                  ],
                ),         const SizedBox(height: 5,),
                Row(
                  children: const [
                    Icon(Icons.whatsapp, size: 18,),
                    SizedBox(width: 5,),
                    Text('+213 554 554 554', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  children: const [
                    Icon(Icons.email, size: 18,),
                    SizedBox(width: 5,),
                    Text('email@gmail.com', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                  ],

                ),
              ],
            ),

            //notes
            const SizedBox(height: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Notes', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                const SizedBox(height: 5,),
                Row(
                  children: const [
                    Icon(Icons.star, size: 18,),
                    Icon(Icons.star, size: 18,),
                    Icon(Icons.star, size: 18,),
                    Icon(Icons.star, size: 18,),
                    Icon(Icons.star, size: 18,),
                    SizedBox(width: 10,),
                    Text('4.5', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                  ],
                ),

              ],
            ),

            //onpen location in maps
            const SizedBox(height: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Localisation', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                InkWell(child: Text('open', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.SECONDARY),),
                  onTap: (){
                    //launch('https://www.google.com/maps/search/?api=1&query=Bab+Ezzouar,+Algiers');
                  },
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
