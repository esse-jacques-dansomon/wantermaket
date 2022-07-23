import 'package:flutter/material.dart';
import 'package:wantermarket/ui/screens/auth/widgets/reset_password_form_widget.dart';

import '../../../config/app_colors.dart';

class ResetPasswordFromScreen extends StatelessWidget {
  const ResetPasswordFromScreen({Key? key}) : super(key: key);

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
                    const Text('Changement de mot de passe', style: TextStyle(color: Colors.white,  fontWeight: FontWeight.bold, fontSize: 22),),
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
                  children: const [
                    //welcome ac texte
                 SizedBox(
                      height: 20,
                    ),

                    //form
                    ResetPasswordFromWidget(),

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
