import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/route/routes.dart';
import 'package:wantermarket/ui/basewidgets/loaders/custom_app_loader.dart';

import '../../../../config/app_colors.dart';
import '../../../../providers/auth_provider.dart';
import '../../../../shared/app_helper.dart';

class ForgotPasswordFromWidget extends StatefulWidget {
  const ForgotPasswordFromWidget({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordFromWidget> createState() => _ForgotPasswordFromWidgetState();
}

class _ForgotPasswordFromWidgetState extends State<ForgotPasswordFromWidget> {
  String? _email;

  @override
  void initState() {
    super.initState();
    _email='';
  }

  void _receiveMail(String mail, BuildContext context) async {
    Provider.of<AuthProvider>(context, listen: false).forgotPassword(mail).then((value) {
      if(value){
        Navigator.of(context).popAndPushNamed(AppRoutes.otp, arguments: _email);
        AppHelper.showInfoFlushBar(context,  'Un email vous a été envoyé pour réinitialiser votre mot de passe');
      }else{
        AppHelper.showInfoFlushBar(context,  'Veuillez vérifir votre mail',color: Colors.red);
      }
    });

  }

  @override
  void dispose() {
    super.dispose();

  }



  Widget _buildEmailField(){
    return SizedBox(
      child: TextFormField(
        onSaved: (value) => _email = value,
        // validator: emailValidator,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Veuillez entrer votre email';
          }else if(!value.contains('@')){
            return 'Veuillez entrer un email valide';
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration:  InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.black,
            ),

          ),
          hintText: 'Email',
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          hintStyle: const TextStyle(color: AppColors.BLACK),
        ),
      ),
    );
  }



  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          _buildEmailField(),
          const SizedBox(
            height: 20,
          ),
          Container(
              width: double.infinity,
              height: 45,
              child:  Provider.of<AuthProvider>(context, listen: true).isLoading ?
              const Center(child: CustomAppLoader(),) :
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppColors.PRIMARY),),
                onPressed: (){
                  if(_formKey.currentState!.validate()){
                    _formKey.currentState?.save();
                    _receiveMail(_email!, context);
                  }
                }, child: const Text('Recevoir', style: TextStyle(
                fontSize: 18,
              ),), )),
        ],
      ),

    );
  }

}
