import 'package:flutter/material.dart';
import 'package:wantermarket/ui/basewidgets/produit_card_without_vendor.dart';
import 'package:card_swiper/card_swiper.dart';
import '../../../config/app_colors.dart';

class ProduitDetailsScreen extends StatelessWidget {
  const ProduitDetailsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Colors.white,
          //   elevation: 0,
          //   title: const Text('Produit Details', style: TextStyle(color: Colors.black),),
          //   leading: IconButton(
          //     icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black,),
          //     onPressed: () => Navigator.pop(context),
          //   ),
          // ),
          bottomNavigationBar: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Text('Le Vendeur'.toUpperCase(), style: const TextStyle( fontSize: 20 , fontWeight: FontWeight.bold),),
                  ),
                ClipOval(
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(AppColors.PRIMARY),
                      ),
                      onPressed: (){}, child: const Icon(Icons.whatsapp, size: 25)),
                ),
                ClipOval(
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(AppColors.PRIMARY),
                      ),
                      onPressed: (){}, child: const Icon(Icons.phone_in_talk_outlined, size: 25)),
                ),
                ClipOval(
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(AppColors.PRIMARY),
                      ),
                      onPressed: (){}, child: const Icon(Icons.message, size: 25)),
                ),
                //message

              ],
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //slider
                Stack(
                  children: [
                    SizedBox(
                      height: 420,
                      width: double.infinity,
                      child: Swiper(
                        indicatorLayout: PageIndicatorLayout.COLOR,
                        itemCount: 3,
                        pagination: const SwiperPagination(
                          alignment: Alignment.bottomCenter,
                          margin: EdgeInsets.only(bottom: 20),
                          builder: DotSwiperPaginationBuilder(
                            color: Colors.grey,
                            activeColor: Colors.white,
                            size: 10,
                            activeSize: 12,
                          ),
                        ),
                        itemBuilder: (context, index) {
                          return Image.network(
                            'https://picsum.photos/250?image=9',
                            fit: BoxFit.cover,
                          );
                        },

                      ),
                    ),
                    Positioned(child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //button back
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.white,),
                          onPressed: () => Navigator.pop(context),
                        ),
                        Column(
                          children: [
                             //button share
                            IconButton(
                              icon: const Icon(Icons.share, color: Colors.white,),
                              onPressed: (){},
                            ),
                            //button favorite
                            IconButton(
                              icon: const Icon(Icons.favorite_border, color: Colors.white,),
                              onPressed: (){},
                            ),                          ],
                        )
                      ],
                    ))
                  ],
                ),
                //product and sseller info
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //nom du produit
                      const SizedBox(height: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          const Text('Mack Boox Pro M1 2021', style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.black),),
                          const SizedBox(height: 10,),
                          RichText(text: const TextSpan(text: 'Categorie', style: const TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
                              children: [
                                const TextSpan(text: ' : ', style: const TextStyle(fontWeight: FontWeight.w300, color: Colors.black)),
                                const TextSpan(text: 'Laptop | Electronique ! IT', style: const TextStyle(fontWeight: FontWeight.w300, color: Colors.black)),
                              ]),),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('2.000.000 fcfa', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                              const Text('3.000.000 fcfa',  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black, decoration: TextDecoration.lineThrough), ),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          const Text('Description', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
                          const SizedBox(height: 10,),
                          const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black),),
                          const SizedBox(height: 10,),
                          //get in touch with teh seller
                          const Text('Get in touch with the seller', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
                          const SizedBox(height: 10,),
                          Container(
                            padding: const EdgeInsets.symmetric( vertical: 5),
                            child: Card(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 100, height: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: const DecorationImage(
                                        image: const NetworkImage('https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text('Nom du vendeur', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                                      SizedBox(height: 5,),
                                      Text('Boutique : Amama', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                                      SizedBox(height: 5,),
                                      Text('Categorie : Phones ! Electoniques', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),),
                                      SizedBox(height: 5,),
                                      Text('Senagal Medina Rue 31x2 Bis', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                        ],
                      )

                    ],
                  ),
                ),
                //related products
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Related Products', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
                      const SizedBox(height: 10,),

                    
                    
                    ]),
                ),
                //
                Container(
                  height: 315,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child:  ListView.builder(
                      itemCount: 15,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index){
                        return const ProduitCardWithoutVendor();
                      }
                  ),
                )

              ],
            ),
          ),
        )
    );
  }
}
