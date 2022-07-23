import 'package:flutter/material.dart';
import 'package:wantermarket/route/routes.dart';
import 'package:wantermarket/ui/screens/auth/widgets/login_form_widget.dart';
import 'package:wantermarket/ui/screens/auth/widgets/reset_password_form_widget.dart';

import '../../../config/app_colors.dart';

class ForgotPasswordFromScreen extends StatelessWidget {
  const ForgotPasswordFromScreen({Key? key}) : super(key: key);

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
                    InkWell(child: Icon(Icons.arrow_back_ios, color: Colors.white,),
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text('Mot de Passe Oublié', style: TextStyle(color: Colors.white,  fontWeight: FontWeight.bold, fontSize: 22),),
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
                      height: 20,
                    ),
                    Text('Veuillez entre votre email', style: TextStyle(color: Colors.grey, fontSize: 16),),

                    //form
                    ResetPasswordFromWidget(),

                    Expanded(child: Container(),),
                    //bottom

                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }
}
