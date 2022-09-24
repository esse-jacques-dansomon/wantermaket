// ignore_for_file: unused_import

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/config/app_dimenssions.dart';
import '../../../providers/payment_provider.dart';
import '../../basewidgets/app_bars/app_bar_with_return.dart';
import '../payment_api/paytech_api_payment_screen.dart';


class BecomeExclusiveScreen extends StatefulWidget {
  const BecomeExclusiveScreen({Key? key}) : super(key: key);

  @override
  State<BecomeExclusiveScreen> createState() => _BecomeExclusiveScreenState();
}

class _BecomeExclusiveScreenState extends State<BecomeExclusiveScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    Provider.of<PaymentProvider>(context, listen: false).paymentLinkStatus = PaymentLinkStatus.initial;
  }

  void _launchPayTechPaymentUrl() async {
    final paymentProvider = Provider.of<PaymentProvider>(context, listen: false);
    await paymentProvider.getBecameExclusiveLink(context).then((url) async {
      if(url != "" )
        {
          await (Navigator.push(context, MaterialPageRoute(builder: (context) =>  PayTechApiPaymentScreen( initialUrl : url)),) );

        }else{
          print("url is empty");
        }

    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWithReturn(title: 'Devenir Exclusive', context: context),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                const Text('Devenez Exclusive', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: AppColors.BLACK),),
                const SizedBox(height: 20,),
                const Text('Envoyez votre demande pour passez exclusive. Notre equipe va prendre un certain temps pour traiter votre demande. ', textAlign: TextAlign.center, style: const TextStyle(fontSize: AppDimensions.FONT_SIZE_DEFAULT+3, fontWeight: FontWeight.bold,color: Colors.grey),),
                const SizedBox(height: 20,),
                const Text('50.000 F CFA / 30 jours', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: AppColors.BLACK),),
                const SizedBox(height: 20,),
                Consumer<PaymentProvider>(
                  builder: (context, paymentProvider, child){
                    switch(paymentProvider.paymentLinkStatus){
                      case PaymentLinkStatus.loading:
                        return const CircularProgressIndicator();
                      case PaymentLinkStatus.initial:
                      case PaymentLinkStatus.loaded:
                        return  ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.PRIMARY)),
                            onPressed: (){
                              _launchPayTechPaymentUrl();
                            },
                            child: const Text('   Envoyer la demande  '));
                      case PaymentLinkStatus.error:
                        return Column(
                          children: [
                            const Text('Erreur'),
                            ElevatedButton(
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.PRIMARY)),
                                onPressed: (){
                                  _launchPayTechPaymentUrl();
                                },
                                child: const Text('   Envoyer une nouvelle demande  ')),
                          ],
                        );
                    }
                  },
                )
              ],
            ),
          ),
        )
    );
  }
}
