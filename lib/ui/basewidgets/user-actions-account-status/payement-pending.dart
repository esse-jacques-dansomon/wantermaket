import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/ui/basewidgets/user-actions-account-status/payement-success.dart';

import '../../../config/app_colors.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/payment_provider.dart';

class PaymentPending extends StatelessWidget {

  const PaymentPending({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 210,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [

            Positioned(
              child: Container(
                margin: const EdgeInsets.only(top: 40),
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    const Text('Payement en attente', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                    const SizedBox(height: 15,),
                    const Text('veuillez actualiser pour suivre l\'etat de votre payement ', style: TextStyle(fontSize: 18,), textAlign: TextAlign.center,),
                    const SizedBox(height: 25,),
                    SizedBox( height: 45, width: double.infinity,
                      child: Consumer<PaymentProvider>(
                        builder: (context, provider, child) {
                          switch (provider.paymentStatus) {
                            case PaymentStatus.error:
                              return const Center(child: Text("Une erreur est survenue"),);
                            case PaymentStatus.loading:
                              return const Center(child: CircularProgressIndicator(),);
                            case PaymentStatus.pending:
                            case PaymentStatus.initial:
                              return ElevatedButton(onPressed: (){
                                Provider.of<PaymentProvider>(context, listen: false).getStatusPayment(context).then((value){
                                  if(value){
                                    Provider.of<AuthProvider>(context, listen: false).verifyIsAuthenticated(context);
                                    showDialog(context: context, barrierDismissible: false, builder: (context){
                                      return  const PaymentSuccess();
                                    });
                                  }
                                });
                              }, style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.orange)),
                                  child: const Text('Actualiser'),);
                          }
                        },
                      ),)

                  ],
                ),
              ),

            ),
            Positioned(
              top: -70,
              child: ClipOval(
                child: Container(height: 90 ,width: 90, color:Colors.orange, child: const Icon(Icons.pending, color: AppColors.WHITE, size: 50,)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
