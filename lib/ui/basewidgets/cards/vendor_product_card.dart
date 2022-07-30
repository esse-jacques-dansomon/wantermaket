import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_images.dart';
import '../../../data/models/body/product.dart';
import '../../../providers/curd_product_provider.dart';
import '../../../providers/vendor_provider.dart';
import '../../../route/routes.dart';
import '../../../shared/app_helper.dart';
import 'package:flutter/material.dart';

class VendorProductCard extends StatelessWidget {
  final Product product;
  const VendorProductCard({
    Key? key, required this.product
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, AppRoutes.product, arguments: product);
      },
      child: Card(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.hardEdge,
              children:  [
                SizedBox(
                  width: double.infinity,
                  height: 180,
                  child: CachedNetworkImage(
                    imageUrl: product.images!.isNotEmpty ? product.images![0].path : AppImage.logo,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(top: 5, right: 0,child: Container(
                    decoration:  BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(2)),
                      color: Colors.grey[100],
                    ),
                    padding: const EdgeInsets.all(2),
                    child:  InkWell(

                      onTap: (){
                        // set up the AlertDialog
                        AlertDialog alert = AlertDialog(
                          title: const Text("Supprimer"),
                          content: const Text("Voulez vous vraiment supprimer ce produit ?"),
                          actions: [
                            TextButton(
                              child: const Text("Annuler"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text("Supprimer"),
                              onPressed: () {
                                Provider.of<CrudProductProvider>(context, listen: false).deleteProduct(product.id!).then((value) => {
                                  if(value){
                                    AppHelper.showInfoFlushBar(context, 'Produit supprimé avec succès', color: AppColors.PRIMARY),
                                    Provider.of<VendorProvider>(context, listen: false).deleteProduct(product.id!),
                                  }else{
                                    AppHelper.showInfoFlushBar(context, 'Produit supprimé avec succès', color: Colors.redAccent),
                                  }
                                });
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                        // show the dialog
                        showCupertinoDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alert;
                          },
                        );
                      },
                      child:  const Icon(Icons.restore_from_trash, color: Colors.red, size: 29,),

                    ),),)


              ],
            ),
            const SizedBox(height: 5,),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text(AppHelper.priceFormat(price: "${product.priceBefore != 0 ? product.priceBefore : product.price}"), maxLines: 2, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: AppColors.SECONDARY),),
                      const SizedBox(height: 5,),
                      Text('${product.name}', maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 13),),
                      const SizedBox(height: 5,),
                      Row(
                        children: [
                          Row(
                            children:  [
                              const Icon(Icons.remove_red_eye, color: Colors.grey,),
                              const SizedBox(width: 5,),
                              Text('${product.nombre_vues}'),
                              const SizedBox(width: 5,),
                              const Text('Vues')
                            ],
                          ),

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height:25,
                            child: ElevatedButton(
                                style: const ButtonStyle(

                                ),
                                onPressed: (){
                                  Navigator.pushNamed(context, AppRoutes.addProduct, arguments: product);
                                }, child: const Text('Modifier')),
                          ),
                          //on off button
                          Switch(
                            value: product.disponibility == 'oui'? true : false,
                            onChanged: (value){
                              Provider.of<CrudProductProvider>(context, listen: false).updateDisponibility(product).then((value){
                                if(value){
                                  Provider.of<VendorProvider>(context, listen: false).changeDisponibilityProduct(product.id!, context);
                                  AppHelper.showInfoFlushBar(context, 'Produit modifié');
                                }else{
                                  AppHelper.showInfoFlushBar(context, 'une erreur s\'est produite ', color: Colors.red);
                                }
                              });
                            },),
                        ],
                      )
                    ],
                  ),
                )),

          ],
        ),
      ),
    );
  }
}
