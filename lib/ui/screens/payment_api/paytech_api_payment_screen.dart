import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/providers/auth_provider.dart';
import 'package:wantermarket/providers/payment_provider.dart';
import 'package:wantermarket/ui/basewidgets/user-actions-account-status/payement-pending.dart';
import 'package:wantermarket/ui/basewidgets/user-actions-account-status/payement-success.dart';
import 'package:wantermarket/ui/basewidgets/user-actions-account-status/payment-fail.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../config/app_constantes.dart';


class PayTechApiPaymentScreen extends StatefulWidget {
  final String initialUrl;
  const PayTechApiPaymentScreen({Key? key, required this.initialUrl}) : super(key: key);

  @override
  State<PayTechApiPaymentScreen> createState() => _PayTechApiPaymentScreen();
}

class _PayTechApiPaymentScreen extends State<PayTechApiPaymentScreen> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  var pay = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.initialUrl == 'ecom'){
      Provider.of<AuthProvider>(context, listen: false).verifyIsAuthenticated(context);
    }else if (Platform.isAndroid) {
      WebView.platform = AndroidWebView();
    }
  }


  bool getStatusPayment()  {
    var status = false;
    var paymentProvider = Provider.of<PaymentProvider>(context, listen: false);
    paymentProvider.getStatusPayment(context).then((value) => status = value);
    return status;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: widget.initialUrl == 'ecom' ?
        Container( margin: const EdgeInsets.all(25),child: const Center(child:  PaymentSuccessBox())) :
        WebView(
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated:
              (  WebViewController webViewController) {
            _controller.complete(webViewController);

          },

          onPageStarted: (String url) {
            if(url.toString() == AppConstants. REDIRECT_SUCCESS_PAY_URI){
               Navigator.pop(context); //quiter le site paytech
               if(getStatusPayment()){
                 Provider.of<AuthProvider>(context, listen: false).verifyIsAuthenticated(context);
                 showDialog(context: context, barrierDismissible: false, builder: (context){
                   return  const PaymentSuccess();
                 });
               }else{
                 showDialog(context: context, barrierDismissible: true, builder: (context){
                   return  const PaymentPending();
                 });
               }
            }else if(url.toString() ==  AppConstants.REDIRECT_CANCEL_PAY_URI){
              Navigator.pop(context);
              showDialog(context: context, barrierDismissible: false, builder: (context){
                return const PaymentFail();
              });
            }
          },

          initialUrl: widget.initialUrl,
        ),
      )
    );
  }
}
