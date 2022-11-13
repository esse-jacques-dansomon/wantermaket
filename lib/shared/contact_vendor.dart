import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wantermarket/config/app_constantes.dart';
import 'package:wantermarket/data/models/body/product.dart';
import 'package:wantermarket/shared/app_helper.dart';
import 'package:wantermarket/ui/basewidgets/user-actions-account-status/expire-subscription.dart';

import '../data/models/body/boutique.dart';
import '../providers/auth_provider.dart';

class ContactVendor {


  static void openWhatsapp({required BuildContext context, required Product product}) async {
    var text = """Salut j'espère que vous allez bien. J'ai vu ce produit à ${(product.priceBefore != null && product.priceBefore != 0)  ? product.priceBefore! : product.price} F CFA sur votre boutique Wanter Market. J'aimerais savoir s'il est toujours disponible. Voici le lien : https://wantermarket.sn/produit/${product.code}""";
    var link = "whatsapp://send?phone=${product.boutique?.vendor?.phone}" +
        "&text=${Uri.encodeComponent(text)}";
    try{
      await launchUrl(Uri.parse(link.toString()));
    }catch(e){
      AppHelper.showInfoFlushBar(context, "Impossible de lancer l'application de messagerie");
    }

  }

  static void signalBug({required BuildContext context}) async {
    //send email
    var link = "mailto:${AppConstants.SUPPORT_EMAIL}?subject=Signaler un bug&body=";
    try{
      await launchUrl(Uri.parse(link.toString()));
    }catch(e){
      AppHelper.showInfoFlushBar(context, "Impossible de lancer l'application de messagerie");
    }
  }

  static void openWhatsappVendor({required BuildContext context, required Boutique boutique}) async {
    var link = "whatsapp://send?phone=${boutique.vendor!.phone}" +
        "&text=${Uri.encodeComponent('Bonjour, j''ai vu votre boutique ${boutique.name} sur Wanter Market. je suis intéressé par vos produits. ')}";
    try{
      await launchUrl(Uri.parse(link.toString()));
    }catch(e){
      AppHelper.showInfoFlushBar(context, "Impossible de lancer l'application de messagerie");
    }
  }

  //phone
  static void openPhone({required BuildContext context, required String number}) async {
    try{
      await launchUrl(Uri.parse("tel:$number"));
    }catch(e){
      AppHelper.showInfoFlushBar(context, "Impossible de lancer l'application");
    }
  }

  //message
  static void openMessage({required BuildContext context, required String number}) async {
    try{
      await launchUrl(Uri.parse("sms:$number"));
    }catch(e){
      AppHelper.showInfoFlushBar(context, "Impossible de lancer l'application de messagerie");
    }
  }

  static void shareShop(Boutique boutique) async{
    await FlutterShare.share(
      title: 'Boutique ${boutique.name}',
      text: 'Je vous invite à visiter la boutique "${boutique.name}" sur Wanter Market en cliquant sur ce lien :',
      linkUrl: '''https://wantermarket.sn/boutiques/${boutique.slug}''',
    );
  }



  static void shareProduct(Product product) async{
    await FlutterShare.share(
      title: '${product.name}',
      text: '${product.name} à ${(product.priceBefore != null && product.priceBefore != 0)  ? product.priceBefore! : product.price} F CFA chez ${product.boutique!.name!} sur Wanter Market. Visitez en cliquant sur ce lien : ',
      linkUrl: '''https://wantermarket.sn/produits/${product.slug}''',
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

  static void openSocialMedia({required String url,  required BuildContext context}) async{
    try{
      await launchUrl(Uri.parse(url));
    }catch(e){
      AppHelper.showInfoFlushBar(context, "Ce lien n'est pas valide");
    }
  }

  static Future<void> contactUs(BuildContext context) async {
    try{
      await launchUrl(Uri.parse(AppConstants.CAURIS_URL));
    }catch(e){
      AppHelper.showInfoFlushBar(context, "Une erreur s'est produite");
    }
  }

  //write on whatsapp
  static void writeOnWhatsapp({required BuildContext context, required String number}) async {
    var link = "whatsapp://send?phone=$number";
    try{
      await launchUrl(Uri.parse(link.toString()));
    }catch(e){
      AppHelper.showInfoFlushBar(context, "Impossible de lancer l'application de messagerie");
    }
  }


}