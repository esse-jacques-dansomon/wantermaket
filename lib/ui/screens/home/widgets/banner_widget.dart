import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 30.0, bottom: 10, left: 15, right: 15 ),
      child: Container(
        foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
        ),
        child: Image.network('https://wantermarket.com/assets/images/backgrounds/pub.png'), ) ,
    );
  }
}
