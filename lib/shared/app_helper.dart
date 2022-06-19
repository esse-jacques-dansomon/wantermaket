import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppHelper {
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static String getAssetName(String fileName, String folderName) {
    return "assets/$folderName/$fileName";
  }

  static TextTheme getTheme(BuildContext context) {
    return Theme.of(context).textTheme;
  }

  static String priceFormat({required String price, String currency='FCFA'}){
    return '${NumberFormat.currency(locale: 'fr_FR', symbol: '', decimalDigits: 0).format(int.parse(price))} ${currency}';
  }
}