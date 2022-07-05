import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wantermarket/shared/app_helper.dart';
import 'package:wantermarket/ui/basewidgets/produit_by_boutique_3.dart';
import '../../../config/app_colors.dart';
import '../../../data/models/body/product.dart';
import '../../../providers/product_provider.dart';
import '../../../shared/contact_vendor.dart';
import '../../basewidgets/produit_by_boutique.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  const ProductDetailsScreen({Key? key, required this.product}) : super(key: key);


  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();



}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  Future<void> _loadData() async {
    Provider.of<ProductProvider>(context, listen: false).getRelatedProducts(widget.product.idCategorie!);
  }


  @override
  initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          bottomNavigationBar: SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //whatSapp
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.green),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),)
                      ),
                      onPressed: (){
                        ContactVendor.openWhatsapp(context: context, number:widget.product.vendor!.phone!, text: "Bonjour, je voudrais commander ${widget.product.name}");
                      }, child: Row(
                    children: const [
                      Icon(Icons.whatsapp, size: 25),
                      SizedBox(width: 5,),
                      Text('WhatsApp', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),),
                    ],
                  )),
                ),

                //phone call
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.black54),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),)
                      ),
                      onPressed: (){
                        ContactVendor.openPhone(context: context, number:widget.product.vendor!.phone!);

                      }, child: Row(
                        children: const [
                          Icon(Icons.call_outlined, size: 25),
                          SizedBox(width: 5,),
                          Text('Appel', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),),
                        ],
                      )),
                ),

                //message
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.black54),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),)
                      ),
                      onPressed: (){
                        ContactVendor.openMessage(context: context, number:widget.product.vendor!.phone!);

                      }, child: Row(
                        children: const [
                          Icon(Icons.sms_outlined, size: 25),
                          SizedBox(width: 5,),
                          Text('SMS', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),),
                        ],
                      )),
                ),
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
                      height: 430,
                      width: double.infinity,
                      child: Swiper(
                        indicatorLayout: PageIndicatorLayout.COLOR,
                        itemCount: widget.product.images!.length,
                        pagination: const SwiperPagination(
                          alignment: Alignment.bottomCenter,
                          margin: EdgeInsets.only(bottom: 15),
                          builder: DotSwiperPaginationBuilder(
                            color: Colors.grey,
                            activeColor: Colors.white,
                            size: 10,
                            activeSize: 12,
                          ),
                        ),
                        itemBuilder: (context, index) {
                          return Image.network(
                            widget.product.images![index].path.replaceAll('\r\n', ''),
                            fit: BoxFit.cover,
                          );
                        },

                      ),
                    ),
                    Positioned(child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //button back
                          IconButton(
                            icon: const Icon(Icons.arrow_back_ios_rounded, color: AppColors.SECONDARY,),
                            onPressed: () => Navigator.pop(context),
                          ),
                          Column(
                            children: [
                              //button share
                              IconButton(
                                icon: const Icon(Icons.share, color: AppColors.SECONDARY,),
                                onPressed: (){},
                              ),
                              //button favorite
                              IconButton(
                                icon: const Icon(Icons.favorite_border, color: AppColors.SECONDARY,),
                                onPressed: (){},
                              ),                          ],
                          )
                        ],
                      ),
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
                      const SizedBox(height: 15,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text(widget.product.name!, style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.black),),
                          const SizedBox(height: 10,),
                          RichText(text:  TextSpan(text: 'Categorie', style: const TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
                              children: [
                                const TextSpan(text: ' : ', style: TextStyle(fontWeight: FontWeight.w300, color: Colors.black)),
                                TextSpan(text: '${widget.product.idCategorie!}', style: const TextStyle(fontWeight: FontWeight.w300, color: Colors.black)),
                              ]),),
                          const SizedBox(height: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              (widget.product.priceBefore != null && widget.product.priceBefore != 0) ?Column(children: [
                                 Text(AppHelper.priceFormat(price: '${widget.product.price}'), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                                 Text(AppHelper.priceFormat(price: '${widget.product.priceBefore}'),  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.black, decoration: TextDecoration.lineThrough), )
                              ],):
                           Text(AppHelper.priceFormat(price: '${widget.product.price}'),  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.black), ),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          const Text('Description', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
                          const SizedBox(height: 10,),
                          Text(widget.product.descriptionBrief!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black),),
                          const SizedBox(height: 10,),
                          const Text('Vendeur', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(widget.product.boutique!.profilImage!),
                                radius: 20,
                              ),
                              const SizedBox(width: 10,),
                              Text(widget.product.boutique!.name!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black),),
                              const SizedBox(width: 20,),
                              const Icon(Icons.verified, color: AppColors.SECONDARY,)
                            ],
                          )

                        ],
                      )

                    ],
                  ),
                ),
                //related products
                const SizedBox(height: 10,),
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
                  child:  Consumer<ProductProvider>(
                    builder: (ctx, productProvider, child){
                      return ListView.separated(
                          itemCount: productProvider.relatedProducts.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => const SizedBox(width: 10,),
                          itemBuilder: (context, index){
                            return  SizedBox(width: 230, child: ProductByBoutique3(product: productProvider.relatedProducts[index],));
                          }
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10,),



                //get in touch with teh seller
                // Container(
                //   padding: const EdgeInsets.symmetric(horizontal: 10),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       SizedBox(
                //       height: 10,),
                //       const Text('Get in touch with the seller', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
                //       Container(
                //         padding: const EdgeInsets.symmetric( vertical: 5),
                //         child: Card(
                //           child: Row(
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             children: [
                //               Container(
                //                 width: 100, height: 100,
                //                 decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(10),
                //                   image: const DecorationImage(
                //                     image: const NetworkImage('https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                //                     fit: BoxFit.cover,
                //                   ),
                //                 ),
                //               ),
                //               const SizedBox(width: 10),
                //               Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: const [
                //                   Text('Nom du vendeur', style: TextStyle(fontSize: 16,  color: Colors.black),),
                //                   SizedBox(height: 5,),
                //                   Text('Boutique : Amama', style: TextStyle(fontSize: 16, color: Colors.black),),
                //                   SizedBox(height: 5,),
                //                   Text('Categorie : Phones ! Electoniques', style: TextStyle(fontSize: 12, color: Colors.black),),
                //                   SizedBox(height: 5,),
                //                   Text('Senagal Medina Rue 31x2 Bis', style: TextStyle(fontSize: 15, color: Colors.black),),
                //                 ],
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //       const SizedBox(width: 20),
                //     ],
                //   ),
                // )


              ],
            ),
          ),
        )
    );
  }
}
