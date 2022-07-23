import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/data/models/body/product.dart';
import 'package:wantermarket/providers/wishlist_provider.dart';
import 'package:wantermarket/shared/app_helper.dart';

import '../../config/app_dimenssions.dart';
import '../../data/models/body/vendor.dart';
import '../../route/routes.dart';
import '../../shared/contact_vendor.dart';

class ProductByBoutique3 extends StatelessWidget {
  final Product product;
  final bool isWishlist;
  const ProductByBoutique3({Key? key, required this.product,  this.isWishlist=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.product, arguments: product);
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
                      decoration:  BoxDecoration(
                        image:  DecorationImage(
                          image: NetworkImage(
                            product.images?[0].path.replaceAll('\r\n', '') ?? 'https://wantermarket.sn/views/assets/images/slider/home_back2.jpg',
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
                        child: InkWell(
                            onTap: (){
                              isWishlist ?
                              Provider.of<WishlistProvider>(context, listen: false).removeFromWishlist(product, context) :
                              Provider.of<WishlistProvider>(context, listen: false).addToWishlist(product, context);
                            },
                            child:  Icon( !isWishlist ? Icons.favorite_border_outlined :Icons.favorite , color: !isWishlist ? Colors.blueAccent : Colors.red,))),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 5.0, bottom: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(AppHelper.priceFormat(price: "${product.price?? product.priceBefore}".toString()), style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.SECONDARY),),
                    const SizedBox(height: 5),
                    SizedBox(width: 215, child: Text(product.name!,  maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),)),
                    // contact button
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:  [
                            //localisation icon
                            const Icon(Icons.location_on_outlined, color: AppColors.BLACK, size: 14, ),
                            const SizedBox(width: 5,),
                            SizedBox(width:135, child: Text("${ product.vendor!.city!  } ${ product.vendor!.country == "SN" ? "Sénégal": "Togo"  }" , style: const TextStyle(fontSize: 10, color: Colors.black, overflow: TextOverflow.ellipsis),)),
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
                                  Navigator.of(context).pushNamed(AppRoutes.vendor, arguments: product.vendor!);
                                },
                                child:  SizedBox(width: 135, child: Text(product.boutique!.name ?? product.vendor!.email! , style: const TextStyle(fontSize: 10, color: Colors.black, ), overflow: TextOverflow.ellipsis,)), ),
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
                                builder: (context) =>  ContactsDialog(vendor: product.vendor!),
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
                          margin: const EdgeInsets.only(left: 0),
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
  final Vendor vendor;
  const ContactsDialog({
    Key? key, required this.vendor
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
                onPressed: (){
                  ContactVendor.openPhone(context: context, number: vendor.phone!);
                }, child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.call_outlined, size: 25),
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
                onPressed: (){
                  ContactVendor.openMessage(context: context, number: vendor.phone!);

                }, child: Row(
              children: const [
                Icon(Icons.sms_outlined, size: 25),
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
                onPressed: (){
                  ContactVendor.openWhatsappVendor(context: context, vendor: vendor);

                }, child: Row(
              children: const [
                Icon(Icons.whatsapp, size: 25),
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
