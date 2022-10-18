import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/config/app_images.dart';
import 'package:wantermarket/data/models/body/product.dart';
import 'package:wantermarket/providers/crud_product_provider.dart';
import 'package:wantermarket/providers/vendor_provider.dart';
import 'package:wantermarket/route/routes.dart';
import 'package:wantermarket/shared/app_helper.dart';
import 'package:wantermarket/shared/contact_vendor.dart';
import 'package:wantermarket/ui/screens/payment_api/paytech_api_payment_screen.dart';

import '../../../../providers/payment_provider.dart';

class ProductButtons extends StatelessWidget {
  final Product product;
  const ProductButtons({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void _launchPayTechPaymentUrl() async {
      final paymentProvider = Provider.of<PaymentProvider>(context, listen: false);
      await paymentProvider.getBoosterProductLink(context, product).then((url) async {
        if(url != "" )
        {
          await (Navigator.push(context, MaterialPageRoute(builder: (context) =>  PayTechApiPaymentScreen( initialUrl : url)),) );
        }else{
          AppHelper.showErrorFlushBar(context, "Une erreur s'est produite");
        }
      });
    }

    return Container(
      height: 330,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 25, top: 20, right: 25),
            child: Row(
              children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(product.images?[0].path ?? AppImage.logo),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      product.categorie!.name??'',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

            ],),
          ),
          SizedBox(height: 7,),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.add_circle, size: 27, color: AppColors.FACEBOOK,),
                  title: Text("Booster", style: TextStyle(fontSize: 18, ),),
                  onTap: () {
                    if(product.isBoosted! == true ){
                      showDialog<void>(
                        context: context,
                        barrierDismissible: true,
                        // false = user must tap button, true = tap outside dialog
                        builder: (BuildContext dialogContext) {
                          return AlertDialog(
                            title: Text('Booster'),
                            content: Text('Ce produit est déjà boosté'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Ok'),
                                onPressed: () {
                                  Navigator.of(dialogContext)
                                      .pop(); // Dismiss alert dialog
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }else{
                      _launchPayTechPaymentUrl();
                    }
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.share, size: 27, color: Colors.blue,),
                  title: Text("Partager", style: TextStyle(fontSize: 18),),
                  onTap: () {
                    ContactVendor.shareProduct(product);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.edit, size: 27, color: Colors.black54,),
                  title: Text("Modifier",style: TextStyle(fontSize: 18),),
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.addProduct, arguments: product);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.restore_from_trash_rounded, size: 27, color: Colors.red,),
                  title: Text("Supprimer", style: TextStyle(fontSize: 18)),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                  onTap: () {
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
                            Provider.of<CrudProductProvider>(context, listen: false).deleteProduct(context, product.id!).then((value) => {
                              if(value){
                                AppHelper.showInfoFlushBar(context, 'Produit supprimé avec succès', color: AppColors.PRIMARY),
                                Provider.of<VendorProvider>(context, listen: false).deleteProduct(product.id!),
                                Navigator.of(context).pop(),
                              }else{
                                AppHelper.showInfoFlushBar(context, 'Une erreur s\'est produite', color: Colors.redAccent),
                              }
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                    // show the dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    );
                  },
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}
