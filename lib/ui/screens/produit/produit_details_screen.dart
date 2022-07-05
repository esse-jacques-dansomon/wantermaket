import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:wantermarket/shared/app_helper.dart';
import '../../../data/models/body/product.dart';
import '../../basewidgets/produit_by_boutique.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  const ProductDetailsScreen({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          bottomNavigationBar: SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                        children: const [
                          Icon(Icons.call_outlined, size: 25),
                          SizedBox(width: 5,),
                          Text('Appel', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),),
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
                        children: const [
                          Icon(Icons.sms_outlined, size: 25),
                          SizedBox(width: 5,),
                          Text('SMS', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),),
                        ],
                      )),
                ),SizedBox(
                  height: 40,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),)
                      ),
                      onPressed: (){}, child: Row(
                        children: const [
                          Icon(Icons.whatsapp, size: 25),
                          SizedBox(width: 5,),
                          Text('WhatsApp', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),),
                        ],
                      )),
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
                        itemCount: product.images!.length,
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
                            product.images![index].path.replaceAll('\r\n', ''),
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
                //product informations
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
                          Text(product.name!, style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.black),),
                          const SizedBox(height: 10,),
                          RichText(text:  TextSpan(text: 'Categorie', style: const TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
                              children: [
                                const TextSpan(text: ' : ', style: TextStyle(fontWeight: FontWeight.w300, color: Colors.black)),
                                TextSpan(text: '${product.idCategorie!}', style: const TextStyle(fontWeight: FontWeight.w300, color: Colors.black)),
                              ]),),
                          const SizedBox(height: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              product.priceBefore != null ?Column(children: [
                                 Text(AppHelper.priceFormat(price: '${product.price}'), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                                 Text(AppHelper.priceFormat(price: '${product.priceBefore}'),  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.black, decoration: TextDecoration.lineThrough), )
                              ],):
                           Text(AppHelper.priceFormat(price: '${product.price}'),  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.black, decoration: TextDecoration.lineThrough), ),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          const Text('Description', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
                          const SizedBox(height: 10,),
                          Text(product.descriptionBrief!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black),),
                          const SizedBox(height: 10,),
                        ],
                      )

                    ],
                  ),
                ),
                //related products
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Produits Similaires : ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
                        SizedBox(height: 10,),

                      ]),
                ),
                //
                Container(
                  height: 325,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child:  ListView.builder(
                      itemCount: 15,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index){
                        return  Container(width: 210, child: ProductByBoutique(id: index,));
                      }
                  ),
                ),


                //get in touch with teh seller
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                      height: 10,),
                      const Text('Get in touch with the seller', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
                      Container(
                        padding: const EdgeInsets.symmetric( vertical: 5),
                        child: Card(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 100, height: 100,
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
                                  Text('Nom du vendeur', style: TextStyle(fontSize: 16,  color: Colors.black),),
                                  SizedBox(height: 5,),
                                  Text('Boutique : Amama', style: TextStyle(fontSize: 16, color: Colors.black),),
                                  SizedBox(height: 5,),
                                  Text('Categorie : Phones ! Electoniques', style: TextStyle(fontSize: 12, color: Colors.black),),
                                  SizedBox(height: 5,),
                                  Text('Senagal Medina Rue 31x2 Bis', style: TextStyle(fontSize: 15, color: Colors.black),),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                    ],
                  ),
                )


              ],
            ),
          ),
        )
    );
  }
}
