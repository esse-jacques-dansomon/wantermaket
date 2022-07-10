import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wantermarket/data/models/body/product.dart';

import '../data/models/body/vendor.dart';

class ContactVendor {
  static void openWhatsapp({required BuildContext context, required Product product}) async {
    var text = """Salut j'espère que vous allez bien. J'ai vu ce produit à ${product.priceBefore ?? product.price} F CFA sur votre boutique Wanter Market. J'aimerais savoir s'il est toujours disponible. Voici le lien : https://wantermarket.sn/produit/${product.code}""";
    var whatsappURlAndroid = "https://wa.me/${product.vendor!.phone}/?text=${Uri.encodeFull(text)}";
    var whatsappURLIos =  "https://api.whatsapp.com/send?phone=${product.vendor!.phone}&text=${Uri.encodeFull(text)}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(Uri.parse(whatsappURLIos))) {
        await launchUrl(Uri.parse(
          whatsappURLIos,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Whatsapp not installed")));
      }
    } else {
      // android , web
      if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
        await launchUrl(Uri.parse(whatsappURlAndroid));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Whatsapp not installed")));
      }
    }
  }

  static void openWhatsappVendor({required BuildContext context, required Vendor vendor}) async {
    var whatsappURlAndroid = "https://wa.me/${vendor.phone!}";
    var whatsappURLIos =  "https://api.whatsapp.com/send?phone=${vendor.phone!}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(Uri.parse(whatsappURLIos))) {
        await launchUrl(Uri.parse(
          whatsappURLIos,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Whatsapp not installed")));
      }
    } else {
      // android , web
      if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
        await launchUrl(Uri.parse(whatsappURlAndroid));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Whatsapp not installed")));
      }
    }
  }

  //phone
  static void openPhone({required BuildContext context, required String number}) async {
    if (await canLaunchUrl(Uri.parse("tel:$number"))) {
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
}