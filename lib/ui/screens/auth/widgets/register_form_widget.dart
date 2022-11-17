import 'package:circle_flags/circle_flags.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/providers/location_provider.dart';
import 'package:wantermarket/ui/basewidgets/loaders/custom_app_loader.dart';

import '../../../../config/app_colors.dart';
import '../../../../config/app_constantes.dart';
import '../../../../data/models/body/app_country.dart';
import '../../../../data/models/body/register_model.dart';
import '../../../../providers/auth_provider.dart';
import '../../../../route/routes.dart';
import '../../../../shared/contact_vendor.dart';

class RegisterFormWidget extends StatefulWidget {
  const RegisterFormWidget({Key? key}) : super(key: key);

  @override
  State<RegisterFormWidget> createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  bool _confirmTermsAndConditions = false;
  String _phone= '';
  String _countryCode = '+221';
  String country = "sn";
  bool _obscureText = true;
  bool _obscureTextConfirmedPassword = true;
  final _usernameController = TextEditingController(text: '');
  final  _firstnameController = TextEditingController(text: '');
  final _emailController = TextEditingController(text: '');
  final _countryController = TextEditingController(text: '');
  final _phoneController = TextEditingController(text: '');
  final _nomBoutiqueController = TextEditingController(text: '');
  final _addressController = TextEditingController(text: '');
  final __passwordController = TextEditingController(text: '');
  final _confirmPasswordController = TextEditingController(text: '');
  List<AppCountry> countries = [];
  FocusNode? _firstnameNode;
  FocusNode? _nomButiqueNode;
  FocusNode? _addressNode;
  FocusNode? _passwordNode;
  FocusNode? _confirmedpasswordNode;
  FocusNode? _emailNode;
  FocusNode? _phoneNode;
  FocusNode? _usernameNode;
  FocusNode? _countryNode;


  @override
  void initState() {
    super.initState();
    countries  = Provider.of<LocalizationProvider>(context, listen: false).countries;
    _countryCode='+221';
    _usernameNode = FocusNode();
    _firstnameNode = FocusNode();
    _nomButiqueNode = FocusNode();
    _addressNode = FocusNode();
    _usernameNode = FocusNode();
    _emailNode = FocusNode();
    _phoneNode = FocusNode();
    _passwordNode = FocusNode();
    _countryNode = FocusNode();
    _confirmedpasswordNode = FocusNode();
  }

  Future<void> register(RegisterModel registerModel ) async {

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    await authProvider.register(registerModel, context);
    if (authProvider.isLoggedIn()) {
      authProvider.updateToken();
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed(AppRoutes.profile);
    }else{

    }

  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _firstnameController.dispose();
    _emailController.dispose();
    _countryController.dispose();
    _phoneController.dispose();
    _nomBoutiqueController.dispose();
    _addressController.dispose();
    __passwordController.dispose();

    _confirmPasswordController.dispose();
    _firstnameNode?.dispose();
    _nomButiqueNode?.dispose();
    _addressNode?.dispose();
    _passwordNode?.dispose();
    _confirmedpasswordNode?.dispose();
    _emailNode?.dispose();
    _phoneNode?.dispose();
    _usernameNode?.dispose();
  }


  final _formRegisterKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formRegisterKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          _buildUsernameField(),
          _buildFirstnameField(),
          _buildBoutiqueNameField(),
          _CountryField(),
          _buildAddressField(),
          _buildPhoneField(),
          _buildEmailField(),
          _buildPasswordField(),
          _buildConfirmedPasswordField(),
          _buildConfirmTermsAndConditionsField(),
          SizedBox(
              width: double.infinity,
              height: 45,
              child: Provider.of<AuthProvider>(context, listen: true).isLoadingRegister ? const Center(child: CustomAppLoader()): ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColors.PRIMARY),),
                  onPressed: () {

                    if(_formRegisterKey.currentState !=null && _formRegisterKey.currentState!.validate() && _confirmTermsAndConditions){
                      _formRegisterKey.currentState?.save();
                      final registerModel = RegisterModel(
                        name: _firstnameController.text,
                        firstName: _firstnameController.text,
                        email: _emailController.text,
                        phone: _phone,
                        address: _addressController.text,
                        country: this.country,
                        boutiqueName: _nomBoutiqueController.text,
                        password: __passwordController.text,
                      );
                      print(registerModel.toJson());
                      register(registerModel);
                    }else{
                      if(!_confirmTermsAndConditions){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Veuillez accepter les conditions d\'utilisation')));
                      }
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
        validator: (value) {
          if (value!.isEmpty) {
            return 'Veuillez entrer votre nom';
          }
          return null;
        },
        controller: _usernameController,
        // onSaved: (value) => _username = value,
        onEditingComplete: (){
          // Once user click on Next then it go to password field
          _firstnameNode!.requestFocus();
        },

        // validator: requiredValidator,
        textInputAction: TextInputAction.next,
        decoration:  InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          hintText: 'Nom',
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
        validator: (value) {
          if (value!.isEmpty) {
            return 'Veuillez entrer votre prénom';
          }
          return null;
        },
        controller: _firstnameController,

        // onChanged: (value) => _firstname = value,
        onEditingComplete: (){
          // Once user click on Next then it go to password field
          _nomButiqueNode!.requestFocus();
        },

        // validator: requiredValidator,
        textInputAction: TextInputAction.next,
        decoration:  InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          hintText: 'Prénom',
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
        validator: (value) {
          if (value!.isEmpty) {
            return 'Veuillez entrer le nom de votre boutique';
          }
          return null;
        },
        controller: _nomBoutiqueController,
        onEditingComplete: (){
          // Once user click on Next then it go to password field
          _countryNode!.requestFocus();
        },

        // validator: requiredValidator,
        textInputAction: TextInputAction.next,
        decoration:  InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
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
        validator: (value) {
          if (value!.isEmpty) {
            return 'Veuillez entrer votre adresse';
          }
          return null;
        },
        controller: _addressController,
        onEditingComplete: (){
          // Once user click on Next then it go to password field
          _phoneNode!.requestFocus();
        },

        // validator: requiredValidator,
        textInputAction: TextInputAction.next,
        decoration:  InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          hintText: 'Adresse',
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
        validator: (value) {
          if (value!.isEmpty) {
            return 'Veuillez entrer un mot de passe';
          }
          if (value.length < 6) {
            return 'Le mot de passe doit contenir au moins 6 caractères';
          }
          return null;
        },
        controller: __passwordController,
        focusNode: _passwordNode,
        obscureText: _obscureText,
        textInputAction: TextInputAction.next,
        onEditingComplete: () {
          // Once user click on Next then it go to password field
          _confirmedpasswordNode!.requestFocus();
        },
        decoration:  InputDecoration(
          hintText: 'Mot de Passe',
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
            vertical: 15,
          ),
        ),
        // validator: passwordValidator,
      ),
    );
  }
  Widget _buildConfirmedPasswordField(){
    return Container(
      //remove margin

      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty ) {
            return 'Veuillez confirmer votre mot de passe';
          }
          return null;
        },
        controller: _confirmPasswordController,
        focusNode: _confirmedpasswordNode,
        obscureText: _obscureTextConfirmedPassword,
        decoration:  InputDecoration(
          hintText: 'Confirmer le mot de passe',
          hintStyle: const TextStyle(color: AppColors.PRIMARY),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
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
        // validator: passwordValidator,
      ),
    );
  }
  Widget _buildEmailField(){
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
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
        controller: _emailController,
        // validator: emailValidator,
        textInputAction: TextInputAction.next,
        onEditingComplete: () {
          // Once user click on Next then it go to password field
          _passwordNode!.requestFocus();
        },
        decoration:  InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
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
          if (value!.isEmpty || value =='777777777') {
            return 'Veuillez entrer un numéro de téléphone';
          }
          if (value.length < 9 || value =='777777777') {
            return 'Le numéro de téléphone doit contenir au moins 9 chiffres';
          }
          return null;
        },
        focusNode: _phoneNode,
        initialValue: "77777",
        keyboardType: TextInputType.phone,
        // controller: _phoneController,
        onChanged: (value) => _phone =  '$_countryCode${value.replaceAll(' ', '')}',
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
                _countryCode = countryCode.dialCode!,
              },
              countryFilter: Provider.of<LocalizationProvider>(context, listen: false).countries.map((element) => element.code.toUpperCase()).toList(),
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
  Widget _CountryField(){
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 25),
      height: 55,
      child: DropdownButtonFormField2<String>(
          validator: (value) {
            if (value!.isEmpty) {
              return 'Veuillez choisir un pays';
            }
            return null;
          },
          focusNode: _countryNode,
          // controller: _countryController,
          value: country,
          icon: const Icon(Icons.arrow_downward),
          decoration:  InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Colors.black,
              ),
            ),
            hintText: 'Votre Pays',
            labelText: "Votre Pays",
            hintStyle: const TextStyle(color: AppColors.PRIMARY),
          ),
          style:  TextStyle(color: Colors.deepPurple, decorationStyle: TextDecorationStyle.solid),
          onChanged: (String? value) {
            // This is called when the user selects an item.
            setState(() {
              country = value!;
            });
          },
          items: countries.map((e) =>  DropdownMenuItem(
            alignment: Alignment.center,
            value: e.code.toLowerCase(),
            child: Container(
              width: MediaQuery.of(context).size.width - 100,
              alignment: Alignment.centerLeft,
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleFlag(e.code.toLowerCase(), size: 32,),
                    SizedBox(width: 10),
                    Text(e.nom.toUpperCase(), style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: AppColors.PRIMARY,
                    ),),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          ),).toList()),

    );
  }

  Widget _buildConfirmTermsAndConditionsField() {
    return Container(
      margin: const EdgeInsets.only(bottom: 7, top: 7),
      child: Row(
        children: [
          Checkbox(
            value: _confirmTermsAndConditions,
            onChanged: (value) {
              setState(() {
                _confirmTermsAndConditions = value!;
              });
            },
          ),
          Flexible (
            child:  InkWell(
              onTap: () {
                ContactVendor.openSocialMedia(url: AppConstants.CGU_URI, context: context);
              },
              child: Text(
                'J\'accepte les conditions générales d\'utilisation',
                softWrap: true,
                maxLines: 2,
                style: TextStyle(
                  color: AppColors.PRIMARY,
                  fontSize: 14,

                ),
              ),
            ),
          ),
        ],
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





}
