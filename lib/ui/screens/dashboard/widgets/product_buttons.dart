
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
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

import '../../../../providers/auth_provider.dart';
import '../../../../providers/payment_provider.dart';
import '../../../basewidgets/user-actions-account-status/payement-success.dart';

class ProductButtons extends StatelessWidget {
  final Product product;
  const ProductButtons({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
                      _makePayment(context, product);
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
                    AppRoutes.goTo(context, AppRoutes.addProduct, arguments: product);
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

  _makePayment(BuildContext context, Product product) async {
    showDialog(
      context: context,
      builder: (context) => Container(
        height: 200,
        child: AlertDialog(
          title: const Text(
              'Confirmation de paiement'),
          content: Text('Voulez-vous vraiment booster ce produit?'),
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () async {
                          _launchPayTechPaymentUrl;
                        },
                        child: Container(
                          padding: EdgeInsets.all(Platform.isIOS ? 9 : 19),
                          decoration: BoxDecoration(
                              color: AppColors.SECONDARY,
                              borderRadius:
                              BorderRadius.all(Radius.circular(5))),
                          child: Text(
                            'Payer Par PayTech (Mobile Money et CB)',
                            style: TextStyle(
                                color: AppColors.WHITE, fontSize: 12),
                          ),
                        ),
                      ),
                    ]),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ApplePayButton(
                        paymentConfigurationAsset: 'applepay.json',
                        paymentItems: [
                          PaymentItem(
                            label: 'Booster '  + product.name!,
                            amount: '100',
                            status: PaymentItemStatus.final_price,
                          )
                        ],
                        style: ApplePayButtonStyle.black,
                        type: ApplePayButtonType.buy,
                        onPaymentResult: (value) => {
                          traiterPaiement(
                            context,
                          )
                        },
                        onError: (error) => print(error),
                        loadingIndicator: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      GooglePayButton(
                        paymentConfigurationAsset: 'gpay.json',
                        paymentItems: [
                          PaymentItem(
                            label: 'Booster ' + product.name!,
                            amount: '24000',
                            status: PaymentItemStatus.final_price,
                          )
                        ],
                        type: GooglePayButtonType.pay,
                        onPaymentResult: (value) => {
                          traiterPaiement(
                            context,
                          )
                        },
                        onError: (error) => print(error),
                        loadingIndicator: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ]),
              ],
            ),

          ],
        ),
      ),
    );
  }

  void _launchPayTechPaymentUrl(BuildContext context, Product produit) async {
    final paymentProvider = Provider.of<PaymentProvider>(context, listen: false);
    await paymentProvider.getBoosterProductLink(context, produit).then((url) async {
      if( url != ""  )
      {
        await (Navigator.push(context, MaterialPageRoute(builder: (context) =>  PayTechApiPaymentScreen( initialUrl : url)),) );
      }else{
        AppHelper.showInfoFlushBar(context, "Vous avez bien booster ce produit " + product.name!);
      }
    });
  }

  Future<void> traiterPaiement(context) async {
    var planSubscribe = {
      'type': "boost",
      'produit_id': product.id,
    };
    Provider.of<PaymentProvider>(context, listen: false)
        .submitMobilePayment(context, planSubscribe)
        .then((value) {
      if (value) {
        Provider.of<AuthProvider>(context, listen: false)
            .verifyIsAuthenticated(context);
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return const PaymentSuccess();
            });
      }
    });
  }


}
