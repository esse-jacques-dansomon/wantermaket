
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/providers/auth_provider.dart';
import 'package:wantermarket/route/routes.dart';
import 'package:wantermarket/shared/app_helper.dart';
import 'package:wantermarket/ui/screens/home/home_screen.dart';

import '../../../../config/app_colors.dart';
import '../../../../data/models/body/reset_password_model.dart';

class ResetPasswordFromWidget extends StatefulWidget {
  const ResetPasswordFromWidget({Key? key}) : super(key: key);

  @override
  State<ResetPasswordFromWidget> createState() => _ResetPasswordFromWidgetState();
}

class _ResetPasswordFromWidgetState extends State<ResetPasswordFromWidget> {
  bool _obscureText = true;
  bool _obscureConfirmedText = true;
  bool _obscureOldPasswordText = true;
  String? _oldPassword, _password, _passwordConfirmed;


  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();

  }


  Widget _buildPasswordField(){
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child:
        SizedBox(
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Entrer un mot de passe';
              }
              return null;
            },
            obscureText: _obscureText,
            decoration:  InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
              hintText: 'Mot de passe',
              hintStyle: const TextStyle(color: AppColors.PRIMARY),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: _obscureText
                    ? const Icon(Icons.visibility_off, color: AppColors.PRIMARY)
                    : const Icon(Icons.visibility, color: AppColors.PRIMARY),
              ),
              labelStyle: const TextStyle(
                  color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
            onChanged: (value) => _password = value,
            // validator: passwordValidator,
          ),
        ),

    );
  }
  Widget _buildOldPasswordField(){
    return Container(
      margin: const EdgeInsets.only(),
      child:
        SizedBox(
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Entrer votre ancien mot de passe';
              }
              return null;
            },
            obscureText: _obscureOldPasswordText,
            decoration:  InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
              hintText: 'Ancien mot de passe',
              hintStyle: const TextStyle(color: AppColors.PRIMARY),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureOldPasswordText = !_obscureOldPasswordText;
                  });
                },
                child: _obscureOldPasswordText
                    ? const Icon(Icons.visibility_off, color: AppColors.PRIMARY)
                    : const Icon(Icons.visibility, color: AppColors.PRIMARY),
              ),
              labelStyle: const TextStyle(
                  color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
            onChanged: (value) => _oldPassword = value,
            // validator: passwordValidator,
          ),
        ),

    );
  }
  Widget _buildConfirmedPasswordField(){
    return Container(
      child:
        SizedBox(
          child: TextFormField(
            validator: (value) {
              if (value == null) {
                return 'Confirmer le mot de passe svp';
              }
              if (value != _password) {
                return 'Les mots ${_password}de passe ne correspondent pas';
              }
              return null;
            },
            obscureText: _obscureConfirmedText,
            decoration:  InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
              hintText: 'confirmer le mot de passe',
              hintStyle: const TextStyle(color: AppColors.PRIMARY),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureConfirmedText = !_obscureConfirmedText;
                  });
                },
                child: _obscureConfirmedText
                    ? const Icon(Icons.visibility_off, color: AppColors.PRIMARY)
                    : const Icon(Icons.visibility, color: AppColors.PRIMARY),
              ),
              labelStyle: const TextStyle(
                  color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
            onChanged: (value) => _passwordConfirmed = value,
            // validator: passwordValidator,
          ),
        ),

    );
  }




  void displayDialog(BuildContext context, String title, String text) =>
      showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              title: Text(title, textAlign: TextAlign.center),
              content: Text(text, textAlign: TextAlign.center, ),
            ),
      );

  void _resetPassword(ResetPasswordModel model, BuildContext context) async {
    Provider.of<AuthProvider>(context, listen: false).resetPassword(model).then((value) {
      if(value){
        AppHelper.showInfoFlushBar(context,  'Votre mot de passe a été réinitialisé avec succès');
        Navigator.of(context).pushNamed(AppRoutes.profile);
      }else{
        AppHelper.showInfoFlushBar(context,  'Une erreur s\'est produite',color: Colors.red);
      }
    });

  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          _buildOldPasswordField(),
          const SizedBox(
            height: 20,
          ),
          _buildPasswordField(),
          const SizedBox(
            height: 5,
          ),
          _buildConfirmedPasswordField(),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
              width: double.infinity,
              height: 45,
              child: Provider.of<AuthProvider>(context, listen: true).isLoading ?  const Center(child: CircularProgressIndicator(color: AppColors.PRIMARY,),) :ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppColors.PRIMARY),),
                onPressed: (){
                  print("$_oldPassword, $_password, $_passwordConfirmed");
                  if(_formKey.currentState!.validate()){
                    _formKey.currentState!.save();
                    if(_password!=_passwordConfirmed){
                      AppHelper.showInfoFlushBar(context, 'Les mots de passe ne correspondent pas', color: Colors.red);
                    }
                    else{
                      _resetPassword(ResetPasswordModel(
                        oldPassword: _oldPassword!,
                        password: _password!,
                      ), context);
                    }
                  }
                }, child: const Text('Changer de mot de passe', style: TextStyle(
                fontSize: 16,
              ),), )),
        ],
      ),

    );
  }

}
