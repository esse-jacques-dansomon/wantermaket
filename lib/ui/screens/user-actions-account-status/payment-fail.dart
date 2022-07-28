import 'package:flutter/material.dart';

import '../../../config/app_colors.dart';

class PaymentFail extends StatelessWidget {

  const PaymentFail({Key? key}) : super(key: key);

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
                    const Text('Payement echoué', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                    const SizedBox(height: 15,),
                    const Text('Vous êtes sur le point de vous abonner au plan ', style: TextStyle(fontSize: 18,), textAlign: TextAlign.center,),
                    const SizedBox(height: 25,),
                    SizedBox( height: 45, width: double.infinity, child: ElevatedButton(onPressed: (){
                      // Navigator.pop(context);
                      Navigator.pop(context);
                    }, style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)), child: const Text('Reessayer'),),)

                  ],
                ),
              ),

            ),
            Positioned(
              top: -70,
              child: ClipOval(
                child: Container(height: 90 ,width: 90, color: Colors.red, child: const Icon(Icons.report_gmailerrorred, color: AppColors.WHITE, size: 50,)),
              ),
            )
          ],
        ),
      ),
      // actions: [
      //   TextButton(
      //     child: const Text('Annuler'),
      //     onPressed: () => Navigator.pop(context),
      //   ),
      //   TextButton(
      //     child: const Text('Confirmer'),
      //     onPressed: () {
      //       Navigator.pop(context);
      //       Navigator.pop(context);
      //     },
      //   ),
      // ],
    );
  }
}
