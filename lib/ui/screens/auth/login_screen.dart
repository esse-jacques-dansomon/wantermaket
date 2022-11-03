import 'package:flutter/material.dart';
import 'package:wantermarket/route/routes.dart';
import 'package:wantermarket/ui/screens/auth/widgets/login_form_widget.dart';

import '../../../config/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PRIMARY,
      body: SingleChildScrollView(

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
                    InkWell(child: const Icon(Icons.arrow_back_ios, color: Colors.white,),
                      onTap: (){
                        AppRoutes.goTo(context, AppRoutes.home);
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text('Se Connecter', style: TextStyle(color: Colors.white,  fontWeight: FontWeight.bold, fontSize: 22),),
                  ],
                ),
              ),

              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.8,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //welcome ac texte
                    const SizedBox(
                      height: 30,
                    ),
                    const Text('Bienvenue', style: TextStyle(color: AppColors.PRIMARY,  fontWeight: FontWeight.bold, fontSize: 25),),
                    const SizedBox(
                      height: 7,
                    ),
                    const Text('Veuillez vous authentificer pour continuer', style: TextStyle(color: Colors.grey, fontSize: 16),),

                    //form
                    const LoginFormWidget(),

                    Container(
                      padding: const EdgeInsets.only(bottom: 30, top: 30),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Mot de passe oublié  ?', style: TextStyle(color: Colors.grey, fontSize: 16),),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            child: const Text('Cliquez ici', style: TextStyle(color: AppColors.PRIMARY, fontSize: 16, fontWeight: FontWeight.bold),),
                            onTap: (){
                              Navigator.of(context).popAndPushNamed(AppRoutes.forgotPassword);
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: Container(),),
                    //bottom
                    Container(
                      padding: const EdgeInsets.only(bottom: 30),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Pas encore inscrit ?', style: TextStyle(color: Colors.grey, fontSize: 16),),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            child: const Text('Créer un compte', style: TextStyle(color: AppColors.PRIMARY, fontSize: 16, fontWeight: FontWeight.bold),),
                            onTap: (){
                              Navigator.of(context).popAndPushNamed(AppRoutes.register);
                            },
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }
}
