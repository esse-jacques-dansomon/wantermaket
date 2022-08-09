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
      Provider.of<AuthProvider>(context, listen: false).verifyIsAuthenticated();
    }else if (Platform.isAndroid) {
      WebView.platform = AndroidWebView();
    }
  }


  bool getStatusPayment()  {
    var status = false;
    var paymentProvider = Provider.of<PaymentProvider>(context, listen: false);
    paymentProvider.getStatusPayment().then((value) => status = value);
    return status;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: widget.initialUrl == 'ecom' ?  Container( margin: const EdgeInsets.all(25),child: const Center(child:  PaymentSuccessBox())) :  WebView(
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated:
              (  WebViewController webViewController) {
            _controller.complete(webViewController);

          },

          onPageStarted: (String url) {
            if(url.toString() == "https://wantermarket.sn/success"){
               Navigator.pop(context); //quiter le site paytech
               if(getStatusPayment()){
                 Provider.of<AuthProvider>(context, listen: false).verifyIsAuthenticated();
                 showDialog(context: context, barrierDismissible: false, builder: (context){
                   return  const PaymentSuccess();
                 });
               }else{
                 showDialog(context: context, barrierDismissible: false, builder: (context){
                   return  const PaymentPending();
                 });
               }

            }else if(url.toString() == "https://wantermarket.sn/cancel"){

              //avant =>
              //apres
              // setState(() {
              //   pay = 1;
              // });
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
