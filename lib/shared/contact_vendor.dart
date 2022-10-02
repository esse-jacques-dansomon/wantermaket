import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wantermarket/data/models/body/product.dart';
import 'package:wantermarket/ui/basewidgets/user-actions-account-status/expire-subscription.dart';

import '../data/models/body/boutique.dart';
import '../data/models/body/vendor.dart';
import '../providers/auth_provider.dart';

class ContactVendor {


  static void openWhatsapp({required BuildContext context, required Product product}) async {
    var text = """Salut j'espère que vous allez bien. J'ai vu ce produit à ${product.priceBefore ?? product.price} F CFA sur votre boutique Wanter Market. J'aimerais savoir s'il est toujours disponible. Voici le lien : https://wantermarket.sn/produit/${product.code}""";
    var link = "whatsapp://send?phone=${product.boutique?.vendor?.phone}" +
        "&text=${Uri.encodeComponent(text)}";
    try{
      await launchUrl(Uri.parse(link.toString()));
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Impossible de lancer l'application WhatsApp")));
    }

  }

  static void signalBug() async {
    var text = """Bonjour, je veux signaler un bug sur l'application Wanter Market. Voici le lien : https://wantermarket.sn""";
    var link = "whatsapp://send?phone=+221771100202" +
        "&text=${Uri.encodeComponent(text)}";
    try{
      await launchUrl(Uri.parse(link.toString()));
    }catch(e){

    }
  }

  static void openWhatsappVendor({required BuildContext context, required Vendor vendor}) async {
    var link = "whatsapp://send?phone=${vendor.phone}" +
        "&text=${Uri.encodeComponent('Bonjour')}";
    try{
      await launchUrl(Uri.parse(link.toString()));

    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Impossible de lancer l'application de whatsapp")));
    }
  }

  //phone
  static void openPhone({required BuildContext context, required String number}) async {
    try{
      await launchUrl(Uri.parse("tel:$number"));
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Impossible de lancer l'application de message")));
    }
  }

  //message
  static void openMessage({required BuildContext context, required String number}) async {
    try{
      await launchUrl(Uri.parse("sms:$number"));
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Impossible de lancer l'application de message")));
    }
  }

  static void shareShop(Boutique boutique) async{
      await FlutterShare.share(
          title: 'Boutique ${boutique.name}',
          text: 'Je vous invite à visiter la boutique "${boutique.name}" sur Wanter Market en cliquant sur ce lien :',
          linkUrl: '''https://wantermarket.sn/boutiques/${boutique.name?.replaceAll(' ', '_').toLowerCase()}''',
      );

  }

  static void showCanAddProductDialog(BuildContext context){
    (Provider.of<AuthProvider>(context, listen: false).getUserConnectedInfo()?.canAddProduct == false ||
        Provider.of<AuthProvider>(context, listen: false).getUserConnectedInfo()?.canAddProduct == null) ? showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const ExpireSubscription()) :  false;
  }

  static void launchMaps(Boutique boutique){
    MapsLauncher.launchQuery('${boutique.vendor?.address} ${boutique.vendor?.city} ${boutique.vendor?.country}');
  }
}