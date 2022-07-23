import 'package:flutter/material.dart';

import '../../../../config/app_colors.dart';

class ForgotPasswordFromWidget extends StatefulWidget {
  const ForgotPasswordFromWidget({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordFromWidget> createState() => _ForgotPasswordFromWidgetState();
}

class _ForgotPasswordFromWidgetState extends State<ForgotPasswordFromWidget> {
  bool _obscureText = true;
  String? _email;


  @override
  void initState() {
    super.initState();
    _email='';

  }

  @override
  void dispose() {
    super.dispose();

  }


  // Widget _buildPasswordField(){
  //   return SizedBox(
  //     child: TextFormField(
  //       obscureText: _obscureText,
  //       decoration:  InputDecoration(
  //         hintText: 'Password',
  //         hintStyle: const TextStyle(color: AppColors.PRIMARY),
  //         suffixIcon: GestureDetector(
  //           onTap: () {
  //             setState(() {
  //               _obscureText = !_obscureText;
  //             });
  //           },
  //           child: _obscureText
  //               ? const Icon(Icons.visibility_off, color: AppColors.PRIMARY)
  //               : const Icon(Icons.visibility, color: AppColors.PRIMARY),
  //         ),
  //         labelStyle: const TextStyle(
  //             color: Colors.black),
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(10),
  //           borderSide: const BorderSide(
  //             color: Colors.black,
  //           ),
  //         ),
  //       ),
  //       onSaved: (value) => _password = value,
  //       // validator: passwordValidator,
  //     ),
  //   );
  // }

  Widget _buildEmailField(){
    return SizedBox(
      height: 45,
      child: TextFormField(
        onSaved: (value) => _email = value,
        // validator: emailValidator,
        textInputAction: TextInputAction.next,
        decoration:  InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.black,
            ),

          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
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
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppColors.PRIMARY),),
                onPressed: (){}, child: const Text('Reinitialiser', style: TextStyle(
                fontSize: 18,
              ),), )),
        ],
      ),

    );
  }

}
