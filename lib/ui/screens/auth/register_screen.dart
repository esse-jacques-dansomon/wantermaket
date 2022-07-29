import 'package:flutter/material.dart';
import 'package:wantermarket/route/routes.dart';
import 'package:wantermarket/ui/screens/auth/widgets/register_form_widget.dart';

import '../../../config/app_colors.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PRIMARY,
      body: SingleChildScrollView(
        primary: true,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children : [
              Container(
                color: AppColors.PRIMARY,
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.2,
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(child: Icon(Icons.arrow_back_ios, color: Colors.white,),
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Créer Votre Compte', style: TextStyle(color: Colors.white,  fontWeight: FontWeight.bold, fontSize: 22),),
                    const SizedBox(
                      height: 7,
                    ),
                    const Text('Veuillez creer un compte pour continuer', style: TextStyle(color: Colors.grey, fontSize: 16),),

                  ],
                ),
              ),
              Container(
                decoration:const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.8,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      //form
                      const RegisterFormWidget(),

                      const SizedBox(height: 20,),

                      //bottom
                      Container(
                        padding: const EdgeInsets.only(bottom: 30),
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Déja inscrit ?', style: TextStyle(color: Colors.grey, fontSize: 16),),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              child: const Text('Se Connecter', style: TextStyle(color: AppColors.PRIMARY, fontSize: 16, fontWeight: FontWeight.bold),),
                              onTap: (){
                                Navigator.of(context).popAndPushNamed(AppRoutes.login);
                              },
                            ),
                          ],
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}
