import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/app_colors.dart';
import '../../../../data/models/body/register_model.dart';
import '../../../../providers/auth_provider.dart';
import '../../../../route/routes.dart';

class RegisterFormWidget extends StatefulWidget {
  const RegisterFormWidget({Key? key}) : super(key: key);

  @override
  State<RegisterFormWidget> createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  bool _obscureText = true;
  bool _obscureTextConfirmedPassword = true;
  String?  _username,_firstname , _address, _confirmPassword, _phone, _countryCode, _nomButique, _password, _email;

  FocusNode? _firstnameNode;
  FocusNode? _nomButiqueNode;
  FocusNode? _addressNode;
  FocusNode? _passwordNode;
  FocusNode? _confirmedpasswordNode;
  FocusNode? _emailNode;
  FocusNode? _phoneNode;
  FocusNode? _usernameNode;

  @override
  void initState() {
    super.initState();
    _password=_email=_username=_firstname=_confirmPassword=_phone= _nomButique = _address='';
    _countryCode='+221';
    _usernameNode = FocusNode();
    _firstnameNode = FocusNode();
    _nomButiqueNode = FocusNode();
    _addressNode = FocusNode();
    _usernameNode = FocusNode();
    _emailNode = FocusNode();
    _phoneNode = FocusNode();
    _passwordNode = FocusNode();
    _confirmedpasswordNode = FocusNode();
  }

  Future<void> register() async {

      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final registerModel = RegisterModel(
        name: _username,
        firstName: _firstname,
        email: _email,
        phone: _phone,
        address: _address,
        boutiqueName: _nomButique,
        password: _password,
      );
      await authProvider.register(registerModel, context);
      if (authProvider.isLoggedIn()) {
        if (!mounted) return;
        authProvider.updateToken(context);
        Navigator.of(context).pushReplacementNamed(AppRoutes.profile);
      }else{

      }

  }

  @override
  void dispose() {
    super.dispose();
    _firstnameNode?.dispose();
    _nomButiqueNode?.dispose();
    _addressNode?.dispose();
    _passwordNode?.dispose();
    _confirmedpasswordNode?.dispose();
    _emailNode?.dispose();
    _phoneNode?.dispose();
    _usernameNode?.dispose();
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
          _buildUsernameField(),
          _buildFirstnameField(),
          _buildBoutiqueNameField(),
          _buildAddressField(),
          _buildPhoneField(),
          _buildEmailField(),
          _buildPasswordField(),
          _buildConfirmedPasswordField(),
          SizedBox(
              width: double.infinity,
              height: 45,
              child: Provider.of<AuthProvider>(context, listen: true).isLoadingRegister ? const Center(child: CircularProgressIndicator()): ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColors.PRIMARY),),
                  onPressed: () {

                    if(_formKey.currentState!.validate()){
                      _formKey.currentState?.save();
                      register();
                    }
                  }, child: const Text("Créez votre compte", style: TextStyle(color: Colors.white),)  )
          ),
        ],
      ),

    );
  }


  Widget _buildUsernameField(){
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        initialValue: 'gato junior',
        validator: (value) {
          if (value!.isEmpty) {
            return 'Veuillez entre votre nom';
          }
          return null;
        },
        onFieldSubmitted: (value) => _username = value,
        onEditingComplete: (){
          // Once user click on Next then it go to password field
          _firstnameNode!.requestFocus();
        },

        // validator: requiredValidator,
        textInputAction: TextInputAction.next,
        decoration:  InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 18,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          hintText: 'Votre nom',
          hintStyle: const TextStyle(color: AppColors.PRIMARY),
        ),
        focusNode: _usernameNode,
      ),
    );
  }
  Widget _buildFirstnameField(){
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        initialValue: 'gato junior',
        validator: (value) {
          if (value!.isEmpty) {
            return 'Veuillez entre votre prenom';
          }
          return null;
        },
        onFieldSubmitted: (value) => _firstname = value,
        onEditingComplete: (){
          // Once user click on Next then it go to password field
          _nomButiqueNode!.requestFocus();
        },

        // validator: requiredValidator,
        textInputAction: TextInputAction.next,
        decoration:  InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 18,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          hintText: 'Votre prenon',
          hintStyle: const TextStyle(color: AppColors.PRIMARY),
        ),
        focusNode: _firstnameNode,
      ),
    );
  }
  Widget _buildBoutiqueNameField(){
    return Container(

      margin: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        initialValue: 'gato junior',
        validator: (value) {
          if (value!.isEmpty) {
            return 'Veuillez entre le nom de votre boutique';
          }
          return null;
        },
        onFieldSubmitted: (value) => _nomButique = value,
        onEditingComplete: (){
          // Once user click on Next then it go to password field
          _addressNode!.requestFocus();
        },

        // validator: requiredValidator,
        textInputAction: TextInputAction.next,
        decoration:  InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 18,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          hintText: 'Nom de la boutique',
          hintStyle: const TextStyle(color: AppColors.PRIMARY),
        ),
        focusNode: _nomButiqueNode,
      ),
    );
  }
  Widget _buildAddressField(){
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        initialValue: "gato junior",
        validator: (value) {
          if (value!.isEmpty) {
            return 'Veuillez entre votre adresse';
          }
          return null;
        },
        onFieldSubmitted: (value) => _address = value,
        onEditingComplete: (){
          // Once user click on Next then it go to password field
          _phoneNode!.requestFocus();
        },

        // validator: requiredValidator,
        textInputAction: TextInputAction.next,
        decoration:  InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 18,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          hintText: 'Votre Adresse',
          hintStyle: const TextStyle(color: AppColors.PRIMARY),
        ),
        focusNode: _addressNode,
      ),
    );
  }
  Widget _buildPasswordField(){
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
        child: TextFormField(
          initialValue: '123456',
        validator: (value) {
          if (value!.isEmpty) {
            return 'Veuillez entrer un mot de passe';
          }
          if (value.length < 6) {
            return 'Le mot de passe doit contenir au moins 6 caractères';
          }
          return null;
        },
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
          labelStyle: const TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 18,
          ),
        ),
        onFieldSubmitted: (value) => _password = value,
        // validator: passwordValidator,
      ),
    );
  }
  Widget _buildConfirmedPasswordField(){
    return Container(
      margin: const EdgeInsets.only(bottom: 25),

      child: TextFormField(
        initialValue: '123456',
        validator: (value) {
          if (value!.isEmpty ) {
            return 'Veuillez confirmer votre mot de passe';
          }
          // if (value.length < 6 || value != _password) {
          //   return 'Le mot de passe doit contenir au moins 6 caractères';
          // }
          return null;
        },
        focusNode: _confirmedpasswordNode,
        obscureText: _obscureTextConfirmedPassword,
        decoration:  InputDecoration(
          hintText: 'Confirmer le mot de passe',
          hintStyle: const TextStyle(color: AppColors.PRIMARY),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 18,
          ),
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
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
        ),
        onFieldSubmitted: (value) => _confirmPassword = value,
        // validator: passwordValidator,
      ),
    );
  }
  Widget _buildEmailField(){
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        initialValue: '1@1.com',
        validator: (value) {
          if (value!.isEmpty) {
            return 'Veuillez entrer un email';
          }
          if (!RegExp(
              r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
              .hasMatch(value)) {
            return 'Veuillez entrer un email valide';
          }
          return null;
        },
        focusNode: _emailNode,
        onFieldSubmitted: (value) => _email = value,
        // validator: emailValidator,
        textInputAction: TextInputAction.next,
        onEditingComplete: () {
          // Once user click on Next then it go to password field
          _passwordNode!.requestFocus();
        },
        decoration:  InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 18,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
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
  Widget _buildPhoneField(){
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      height: 60,
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty || value =='77 777 77 77') {
            return 'Veuillez entrer un numéro de téléphone';
          }
          if (value.length < 9 || value =='77 777 77 77') {
            return 'Le numéro de téléphone doit contenir au moins 9 chiffres';
          }
          return null;
        },
        focusNode: _phoneNode,
        initialValue: "777777778",
        keyboardType: TextInputType.phone,
        onFieldSubmitted: (value) => _phone =  '$_countryCode${value.replaceAll(' ', '')}',
        // validator: senegalPhoneNumberValidator,
        textInputAction: TextInputAction.next,
        onEditingComplete: () {
          // Once user click on Next then it go to password field
          _emailNode!.requestFocus();
        },
        decoration:  InputDecoration(
          border: OutlineInputBorder(

            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          hintText: 'Numero de téléphone',

          hintStyle: const TextStyle(color: AppColors.PRIMARY),
          prefix: SizedBox(
            height: 60,
            // For more check https://pub.dev/packages/country_code_picker
            child: CountryCodePicker(
              onChanged: (countryCode) => {
                // Save your country code
                _countryCode = countryCode.dialCode,
              },

              textStyle: const TextStyle(color: AppColors.PRIMARY, fontSize: 16.5,),
              initialSelection: "sn",
              showCountryOnly: false,
              enabled: true,
              searchDecoration: const InputDecoration(contentPadding: EdgeInsets.zero),
            ),
          ),
        ),

      ),
    );  }

  void displayDialog(BuildContext context, String title, String text) =>
      showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              title: Text(title, textAlign: TextAlign.center),
              content: Text(text, textAlign: TextAlign.center, ),
            ),
      );





}
