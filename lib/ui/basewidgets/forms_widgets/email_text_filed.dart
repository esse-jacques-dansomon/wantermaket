import 'package:flutter/material.dart';

import '../../../config/app_colors.dart';

class EmailField extends StatelessWidget {
  late  dynamic email;
  late dynamic emailValidator;
  late dynamic _passwordNode;

  @override
  Widget build(BuildContext context) {

      return SizedBox(
        height: 50,
      child: TextFormField(
        onSaved: (value) => email = value,
        validator: emailValidator,
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
          hintStyle: const TextStyle(color: AppColors.PLACEHOLDER),
        ),
      ),
    );
  }
}
