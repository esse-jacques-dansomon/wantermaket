import 'package:flutter/material.dart';

import '../../../config/app_colors.dart';
import '../../../route/routes.dart';

class PaymentSuccess extends StatelessWidget {

  const PaymentSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      content: PaymentSuccessBox(),
    );
  }
}

class PaymentSuccessBox extends StatelessWidget {
  const PaymentSuccessBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  const Text('Payement effectué', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                  const SizedBox(height: 15,),
                  const Text('Votre payement a été bien effectué', style: TextStyle(fontSize: 18,), textAlign: TextAlign.center,),
                  const SizedBox(height: 25,),
                  SizedBox( height: 45, width: double.infinity, child: ElevatedButton(onPressed: (){
                     Navigator.pop(context);
                     //for pending screen
                    Navigator.popAndPushNamed(context, AppRoutes.profile);
                  }, style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.PRIMARY)), child: const Text('OK'),),)

                ],
              ),
            ),

          ),
          Positioned(
            top: -70,
            child: ClipOval(
              child: Container(height: 90 ,width: 90, color: AppColors.PRIMARY, child: const Icon(Icons.check, color: AppColors.WHITE, size: 50,)),
            ),
          )
        ],
      ),
    );
  }
}
