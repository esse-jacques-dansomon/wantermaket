import 'package:flutter/material.dart';

import '../../../config/app_colors.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: AppColors.WHITE,
          margin: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 0),
                height: 400,
                width: double.infinity,
                child: Image.asset('assets/images/no-internet.jpg', fit: BoxFit.cover,),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.7,
                child: Column(
                  children: [
                    Text('Pas de connexion internet', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                    const SizedBox(height: 15,),
                    Text('Veuillez vérifier votre connexion internet', style: const TextStyle(fontSize: 18,), textAlign: TextAlign.center,),
                    const SizedBox(height: 25,),
                    SizedBox( height: 45, width: double.infinity, child: ElevatedButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: Text('Ressayer', style: const TextStyle(fontSize: 18,),), style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.SECONDARY)),),)
                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
