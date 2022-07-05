import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactVendor {
  static void openWhatsapp({required BuildContext context, required String text, required String number}) async {
    var whatsappURlAndroid = "https://wa.me/$number/?text=${Uri.parse(text)}";
    var whatsappURLIos =  "https://api.whatsapp.com/send?phone=$number=${Uri.parse(text)}";
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