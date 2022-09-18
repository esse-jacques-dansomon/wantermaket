// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:wantermarket/route/routes.dart';

import '../../../config/app_colors.dart';

class ExpireSubscription extends StatelessWidget {

  const ExpireSubscription({Key? key}) : super(key: key);

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
                    const Text('Abonnement Expiré', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                    const SizedBox(height: 15,),
                    const Text('Votre abonnement a expiré, veuillez le renouveller', style: TextStyle(fontSize: 18,), textAlign: TextAlign.center,),
                    const SizedBox(height: 25,),
                    SizedBox( height: 40, width: double.infinity, child: ElevatedButton(onPressed: (){
                      Navigator.pop(context);
                      Navigator.popAndPushNamed(context, AppRoutes.abonnements);
                    }, style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber)), child: const Text('En cliquant ici', style: TextStyle(fontSize: 18),),),)

                  ],
                ),
              ),

            ),
            Positioned(
              top: -70,
              child: ClipOval(
                child: Container(height: 90 ,width: 90, color: Colors.amber, child: Icon(Icons.info_outline_rounded, color: Colors.white, size: 50,)),
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
