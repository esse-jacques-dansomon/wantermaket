import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wantermarket/config/app_dimenssions.dart';
import 'package:wantermarket/providers/payment_provider.dart';
import 'package:wantermarket/ui/basewidgets/app_bars/app_bar_with_return.dart';

import '../../../config/app_colors.dart';

class BecomeExclusiveScreen extends StatefulWidget {
  const BecomeExclusiveScreen({Key? key}) : super(key: key);

  @override
  State<BecomeExclusiveScreen> createState() => _BecomeExclusiveScreenState();
}

class _BecomeExclusiveScreenState extends State<BecomeExclusiveScreen> {

  final payTechPaymentUrl = '';
  void _launchPayTechPaymentUrl() async {
    final paymentProvider = Provider.of<PaymentProvider>(context, listen: false);
    await paymentProvider.getBecameExclusiveLink().then((url) {
      if (url.isNotEmpty) {
        launchUrl(Uri.parse(url));
      }else{
        print('jacques et junior nullons');
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithReturn(title: 'Devenir Exclusive', context: context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                const Text('Devenez Exclusive', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: AppColors.BLACK),),
                const SizedBox(height: 15,),
                const Text('Envoyez votre demande pour passez exclusive. Notre equipe va prendre un certain temps pour traiter votre demande. ', textAlign: TextAlign.center, style: TextStyle(fontSize: AppDimensions.FONT_SIZE_DEFAULT, fontWeight: FontWeight.bold,color: Colors.grey),),
                const SizedBox(height: 15,),
                const Text('25.000 F CFA / 30 jours', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: AppColors.BLACK),),
                const SizedBox(height: 15,),
                ElevatedButton(onPressed: (){
                  _launchPayTechPaymentUrl();
                }, child: const Text('Envoyer la demande'))


              ],
            ),
          ),
        ),
      )
    );
  }
}
