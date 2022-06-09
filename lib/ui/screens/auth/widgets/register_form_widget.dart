import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import '../../../../config/app_colors.dart';

class RegisterFormWidget extends StatefulWidget {
  const RegisterFormWidget({Key? key}) : super(key: key);

  @override
  State<RegisterFormWidget> createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  bool _obscureText = true;
  bool _obscureTextConfirmedPassword = true;
  String? _password, _email, _username, _confirmPassword, _phone, _countryCode, _nomButique;

  FocusNode? _passwordNode;
  FocusNode? _confirmedpasswordNode;
  FocusNode? _emailNode;
  FocusNode? _phoneNode;
  FocusNode? _usernameNode;

  @override
  void initState() {
    super.initState();
    _password='';
    _email='';
    _username='';
    _confirmPassword='';
    _phone='';
    _countryCode= _nomButique ='';
    _usernameNode = FocusNode();
    _emailNode = FocusNode();
    _phoneNode = FocusNode();
    _passwordNode = FocusNode();
    _confirmedpasswordNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _passwordNode?.dispose();
    _confirmedpasswordNode?.dispose();
    _emailNode?.dispose();
    _phoneNode?.dispose();
    _usernameNode?.dispose();
  }

  Widget _buildPasswordField(){
    return SizedBox(
      child: TextFormField(
        focusNode: _passwordNode,
        obscureText: _obscureText,
        textInputAction: TextInputAction.next,

        onEditingComplete: () {
          // Once user click on Next then it go to password field
          _confirmedpasswordNode!.requestFocus();
        },
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
                : const Icon(Icons.visibility, color: AppColors.SECONDARY),
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
  Widget _buildConfirmedPasswordField(){
    return SizedBox(
      child: TextFormField(
        focusNode: _confirmedpasswordNode,
        obscureText: _obscureTextConfirmedPassword,
        decoration:  InputDecoration(
          hintText: 'Confirmed Password',
          hintStyle: const TextStyle(color: AppColors.PRIMARY),

          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureTextConfirmedPassword = !_obscureTextConfirmedPassword;
              });
            },
            child: _obscureTextConfirmedPassword
                ? const Icon(Icons.visibility_off, color: AppColors.PRIMARY)
                : const Icon(Icons.visibility, color: AppColors.SECONDARY),
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
        onSaved: (value) => _confirmPassword = value,
        // validator: passwordValidator,
      ),
    );
  }
  Widget _buildEmailField(){
    return SizedBox(
      child: TextFormField(
        focusNode: _emailNode,
        onSaved: (value) => _email = value,
        // validator: emailValidator,
        textInputAction: TextInputAction.next,
        onEditingComplete: () {
          // Once user click on Next then it go to password field
          _phoneNode!.requestFocus();
        },
        decoration:  InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          hintText: 'Email',
          hintStyle: const TextStyle(color: AppColors.PRIMARY),
        ),
      ),
    );
  }
  Widget _buildPhoneField(){return SizedBox(
      height: 60,
      child: TextFormField(
        focusNode: _phoneNode,
        keyboardType: TextInputType.phone,
        onSaved: (value) => _phone = value,
        // validator: senegalPhoneNumberValidator,
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
          hintText: 'Numero de téléphone',
          hintStyle: const TextStyle(color: AppColors.PRIMARY),
          prefix: SizedBox(
            height: 32,
            // For more check https://pub.dev/packages/country_code_picker
            child: CountryCodePicker(
              onChanged: (countryCode) => {
                // Save your country code
                _countryCode = countryCode.dialCode,
              },
              padding: const EdgeInsets.only(right: 0),
              textStyle: const TextStyle(color: AppColors.PRIMARY, fontSize: 16.5,),
              initialSelection: "SN",
              showCountryOnly: false,
              searchDecoration:
              const InputDecoration(contentPadding: EdgeInsets.zero),
            ),
          ),
        ),

      ),
    );  }
  Widget _buildUserField(String? label){
    return SizedBox(
      child: TextFormField(
        focusNode: _usernameNode,
        onSaved: (value) => label = value,
        // validator: requiredValidator,
        textInputAction: TextInputAction.next,
        onEditingComplete: () {
          // Once user click on Next then it go to password field
          _emailNode!.requestFocus();
        },
        decoration:  InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          hintText: label,
          hintStyle: const TextStyle(color: AppColors.PRIMARY),
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
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          _buildUserField('Nom Complet'),
          const SizedBox(
            height: 20,
          ),
          _buildUserField('Nom De La Boutique'),
          const SizedBox(
            height: 20,
          ),
          _buildUserField('Adresse De La Boutique'),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          _buildEmailField(),

          const SizedBox(
            height: 20,
          ),
          _buildPhoneField(),
          const SizedBox(
            height: 20,
          ),
          _buildPasswordField(),
          const SizedBox(
            height: 20,
          ),
          _buildConfirmedPasswordField(),
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
