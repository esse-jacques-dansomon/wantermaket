import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wantermarket/data/models/body/product.dart';
import 'package:wantermarket/ui/screens/user-actions-account-status/expire-subscription.dart';
import 'package:wantermarket/ui/screens/user-actions-account-status/payment-fail.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import '../data/models/body/boutique.dart';
import '../data/models/body/vendor.dart';
import '../providers/auth_provider.dart';
import '../route/routes.dart';

class ContactVendor {

  static void lauchWhastapp(String product, BuildContext context) async {
      const link = WhatsAppUnilink(
        phoneNumber: '+221778628471',
        text: "Hey! I'm inquiring about the apartment listing",
      );
      await canLaunchUrl(Uri.parse(link.toString())).then((value){
        if(value){
          launch(link.toString());
        }else{
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Erreur'),
              content: Text('Impossible de lancer l\'application WhatsApp'),
              actions: [
                FlatButton(
                  child: Text('OK'),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
          );
        }
      });


  }

  static void openWhatsapp({required BuildContext context, required Product product}) async {
    var text = """Salut j'espère que vous allez bien. J'ai vu ce produit à ${product.priceBefore ?? product.price} F CFA sur votre boutique Wanter Market. J'aimerais savoir s'il est toujours disponible. Voici le lien : https://wantermarket.sn/produit/${product.code}""";
   final link = WhatsAppUnilink(
      phoneNumber: product.vendor!.phone,
      text: text,
    );
    await canLaunchUrl(Uri.parse(link.toString())).then((value){
      if(value){
        launchUrl(Uri.parse(link.toString()));
      }else{
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Erreur'),
            content: Text('Impossible de lancer l\'application WhatsApp'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
        );
      }
    });

  }

  static void openWhatsappVendor({required BuildContext context, required Vendor vendor}) async {
    final link = WhatsAppUnilink(
      phoneNumber: vendor.phone!.replaceAll('+', ''),
      text: "j'ai vu votre boutique sur wantermarket",
    );
    await canLaunchUrl(Uri.parse(link.toString())).then((value){
      if(value){
        launchUrl(Uri.parse(link.toString()));
      }else{
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Erreur'),
            content: Text('Impossible de lancer l\'application WhatsApp'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
        );
      }
    });
  }

  //phone
  static void openPhone({required BuildContext context, required String number}) async {
    if (await canLaunchUrl(Uri.parse("tel:${number.replaceAll('+', '')}"))) {
      await launchUrl(Uri.parse("tel:$number"));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Phone call not available")));
    }
  }

  //message
  static void openMessage({required BuildContext context, required String number}) async {
    if (await canLaunchUrl(Uri.parse("sms:$number"))) {
      await launchUrl(Uri.parse("sms:$number"));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Message not available")));
    }
  }

  static void shareShop() async{
      await FlutterShare.share(
          title: 'Example share',
          text: 'Example share text',
          linkUrl: 'https://flutter.dev/',
          chooserTitle: 'Example Chooser Title'
      );

  }

  static void showCanAddProductDialog(BuildContext context){
    (Provider.of<AuthProvider>(context, listen: false).getUserConnectedInfo()?.canAddProduct == true ||
        Provider.of<AuthProvider>(context, listen: false).getUserConnectedInfo()?.canAddProduct == null) ? showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const ExpireSubscription()) :  false;
  }

  static void launchMaps(Boutique boutique){
    MapsLauncher.launchQuery('${boutique.vendor?.address} ${boutique.vendor?.city} ${boutique.vendor?.country}');
  }
}