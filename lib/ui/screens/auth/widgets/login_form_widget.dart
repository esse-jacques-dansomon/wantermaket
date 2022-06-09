import 'package:flutter/material.dart';

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
  }


  Widget _buildPasswordField(){
    return SizedBox(
      child: TextFormField(
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
        // validator: emailValidator,
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
;
    return Form(
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
          Container(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppColors.PRIMARY),),
                onPressed: (){}, child: Text('Se Connecter', style: TextStyle(
                fontSize: 18,
              ),), )),
        ],
      ),

    );
  }

}
