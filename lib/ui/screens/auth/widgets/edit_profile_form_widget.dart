import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/providers/vendor_provider.dart';
import 'package:wantermarket/route/routes.dart';
import 'package:wantermarket/shared/app_helper.dart';

import '../../../../config/app_colors.dart';
import '../../../../data/models/body/profil_model.dart';
import '../../../../data/models/body/vendor.dart';
import '../../../../providers/auth_provider.dart';
import '../../../../providers/location_provider.dart';

class EditProfileFormWidget extends StatefulWidget {
  const EditProfileFormWidget({Key? key}) : super(key: key);

  @override
  State<EditProfileFormWidget> createState() => _EditProfileFormWidgetState();
}

class _EditProfileFormWidgetState extends State<EditProfileFormWidget> {
  String _countryCode= '+221';
  final _usernameController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  FocusNode? _firstnameNode;
  FocusNode? _addressNode;
  FocusNode? _emailNode;
  FocusNode? _phoneNode;
  FocusNode? _usernameNode;

  @override
  void initState() {
    super.initState();
    final Vendor vendor = Provider.of<VendorProvider>(context, listen:false ).boutique.vendor!;
    _usernameController.text = vendor.name!;
    _firstnameController.text = vendor.firstName!;
    _addressController.text = vendor.address!;
    _phoneController.text = vendor.phone!.replaceAll("+221", "");
    _emailController.text = vendor.email!;


    _usernameNode = FocusNode();
    _firstnameNode = FocusNode();
    _addressNode = FocusNode();
    _usernameNode = FocusNode();
    _emailNode = FocusNode();
    _phoneNode = FocusNode();
  }

  Future<void> updateProfile(EditProfileModel editProfileModel) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.editProfile(editProfileModel).then((value){
      if(value){
        authProvider.getUserConnectedInfo();
        Provider.of<VendorProvider>(context, listen: false).getBoutique(context);
        AppRoutes.goTo(context, AppRoutes.profile);
        AppHelper.showInfoFlushBar(context, 'Profil mis à jour avec succès');
      }else{
        AppHelper.showErrorFlushBar(context, 'Error lors de la modification du profil');
      }
    });

  }

  @override
  void dispose() {
    super.dispose();
    _firstnameNode?.dispose();
    _addressNode?.dispose();
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 15,
          ),
          _buildUsernameField(),
          _buildFirstnameField(),
          _buildAddressField(),
          _buildPhoneField(),
          _buildEmailField(),
          SizedBox(
              width: double.infinity,
              height: 45,
              child: Provider.of<AuthProvider>(context, listen: true).isLoadingRegister ?
              const Center(child: CircularProgressIndicator()):
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColors.PRIMARY),),
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      _formKey.currentState?.save();
                      updateProfile(EditProfileModel(
                        name: _usernameController.text,
                        firstName: _firstnameController.text,
                        address: _addressController.text,
                        phone: "$_countryCode${_phoneController.text}",
                        email: _emailController.text,
                      )).then((value) => {

                      });
                    }
                  }, child: const Text("Valider Les Modifications", style: TextStyle(color: Colors.white),)  )
          ),
        ],
      ),

    );
  }
  Widget _buildUsernameField(){
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        controller: _usernameController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Veuillez entre votre nom';
          }
          return null;
        },
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
          label: const Text('Votre Nom'),
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
        controller: _firstnameController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Veuillez entre votre prenom';
          }
          return null;
        },
        onEditingComplete: (){
          // Once user click on Next then it go to password field
          _addressNode!.requestFocus();
        },

        // validator: requiredValidator,
        textInputAction: TextInputAction.next,
        decoration:  InputDecoration(
          labelText: 'Votre Prenom',
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
  Widget _buildAddressField(){
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        controller: _addressController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Veuillez entre votre adresse';
          }
          return null;
        },
        onEditingComplete: (){
          // Once user click on Next then it go to password field
          _phoneNode!.requestFocus();
        },

        // validator: requiredValidator,
        textInputAction: TextInputAction.next,
        decoration:  InputDecoration(
          labelText: 'Votre Adresse',
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
  Widget _buildEmailField(){
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        controller: _emailController,
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
        // validator: emailValidator,
        textInputAction: TextInputAction.send,
        decoration:  InputDecoration(
          labelText: 'Votre Email',
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
        keyboardType: TextInputType.phone,
        controller: _phoneController,
        textInputAction: TextInputAction.next,
        onEditingComplete: () {
          _emailNode!.requestFocus();
        },
        decoration:  InputDecoration(
          labelText: 'Votre Numéro de Téléphone',
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

}
