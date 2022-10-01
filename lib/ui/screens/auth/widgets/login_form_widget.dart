import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/data/models/body/login_model.dart';
import 'package:wantermarket/providers/auth_provider.dart';
import 'package:wantermarket/route/routes.dart';

import '../../../../config/app_colors.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();

}

class _LoginFormWidgetState extends State<LoginFormWidget> {

  bool _obscureText = true;
  String? _password, _email;
  FocusNode? _passwordNode;

  void _signIn()   {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final loginModel = LoginModel(email: _email!, password: _password!);
    authProvider.login(loginModel, context).then((value) => {
      if (authProvider.isLoggedIn()) {
        (!mounted)?null : Navigator.of(context).pushReplacementNamed(AppRoutes.profile),
      }else{
        if(!authProvider.isLoggedIn()) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Email ou mot de passe incorrect'),
            backgroundColor: Colors.red,
          )),
        }
      }
    });


  }

  @override
  void initState() {
    super.initState();
    _password='';
    _email='';
    _passwordNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _passwordNode?.dispose();
    _email = null;
    _password = null;

  }


  Widget _buildPasswordField(){
    return SizedBox(
      child: TextFormField(
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Veuillez entre un mot de passe';
          }
          return null;
        },
        focusNode: _passwordNode,
        obscureText: _obscureText,
        decoration:  InputDecoration(
          hintText: 'Password',
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
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
        ),
        onSaved: (value) => _password = value,
        // validator: passwordValidator,
      ),
    );
  }

  Widget _buildEmailField(){
    return SizedBox(
      child: TextFormField(
        onSaved: (value) => _email = value,
        validator: (value) => value!.isEmpty ? 'Veuillez entrer un email' : null,
        textInputAction: TextInputAction.next,
        onEditingComplete: () {
          // Once user click on Next then it go to password field
          _passwordNode!.requestFocus();
        },
        decoration:  InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          hintText: 'Email',
          hintStyle: const TextStyle(color: AppColors.BLACK),
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



  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          _buildEmailField(),
          const SizedBox(
            height: 20,
          ),
          _buildPasswordField(),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              width: double.infinity,
              height: 45,
              child: Provider.of<AuthProvider>(context, listen: true).isLoading ? const Center(child: CircularProgressIndicator()): ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColors.PRIMARY),),
                  onPressed: () {

                    if(_formKey.currentState!.validate()){
                      _formKey.currentState?.save();
                      _signIn();
                    }
                  }, child: const Text("Se Connecter", style: TextStyle(color: Colors.white),)  )
          ),
        ],
      ),

    );
  }

}
