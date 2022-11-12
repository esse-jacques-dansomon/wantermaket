import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/data/models/body/boutique_update_model.dart';
import 'package:wantermarket/providers/auth_provider.dart';
import 'package:wantermarket/shared/app_helper.dart';
import 'package:wantermarket/ui/basewidgets/loaders/custom_app_loader.dart';

import '../../../../config/app_dimenssions.dart';
import '../../../../data/models/body/boutique.dart';
import '../../../../providers/category_provider.dart';
import '../../../../providers/vendor_provider.dart';
import '../../../../route/routes.dart';

class BoutiqueForm extends StatefulWidget {
  final Boutique boutique;
  const BoutiqueForm({Key? key, required this.boutique}) : super(key: key);

  @override
  State<BoutiqueForm> createState() => _BoutiqueFormState();
}

class _BoutiqueFormState extends State<BoutiqueForm> {
  final _nomBoutiqueController = TextEditingController( );
  final _latitudeController = TextEditingController();
  final _longitudeController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _facebookController = TextEditingController();
  final _instagramController = TextEditingController();
  final _linkedinController = TextEditingController();
  final _websiteController = TextEditingController();


  FocusNode? _nomBoutiqueNode, _latitudeNode, _longitudeNode, _descriptionNode, _facebookNode, _instagramNode, _linkedinNode, _websiteNode;


  List<dynamic> _selectedItems = [];
  File? photoCouverture, photoProfile ;


  updateBoutiqueForm(BoutiqueUpdateModel boutiqueUpdateModel, File? filePhotoProfile, File? filePhotoCover) async {
    Provider.of<VendorProvider>(context, listen: false).updateBoutique(context, boutiqueUpdateModel,filePhotoProfile: filePhotoProfile, filePhotoCover: filePhotoCover ).then((value) => {
      if(value){
        Provider.of<AuthProvider>(context, listen: false).verifyIsAuthenticated(context),
        Provider.of<AuthProvider>(context, listen: false).getUserConnectedInfo(),
        AppRoutes.goTo(context,  AppRoutes.profile),
        AppHelper.showInfoFlushBar(context, 'Vous avez bien modifié vos informations'),

      }else{
        AppHelper.showInfoFlushBar(context, 'une erreue s\'est produite')
      }

    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AuthProvider>(context, listen: false).verifyIsAuthenticated(context);
    _nomBoutiqueNode = FocusNode();
    _latitudeNode = FocusNode();
    _longitudeNode = FocusNode();
    _descriptionNode = FocusNode();
    _facebookNode = FocusNode();
    _instagramNode = FocusNode();
    _linkedinNode = FocusNode();
    _websiteNode = FocusNode();


    _nomBoutiqueController.text = (widget.boutique.name?.trim()) ?? '';
    _latitudeController.text = widget.boutique.latitude?.trim() ?? '';
    _longitudeController.text = widget.boutique.longitude?.trim() ?? '';
    _descriptionController.text = widget.boutique.bio?.trim() ?? "";
    _facebookController.text = widget.boutique.facebook?.trim() ?? '';
    _instagramController.text = widget.boutique.instagram?.trim() ?? '';
    _linkedinController.text = widget.boutique.linkedin?.trim() ?? '';
    _websiteController.text = widget.boutique.website?.trim() ?? '';

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nomBoutiqueNode?.dispose();
    _latitudeNode?.dispose();
    _longitudeNode?.dispose();
    _descriptionNode?.dispose();
    _selectedItems = widget.boutique.secteurs?.map((e) => e.id).toList() ?? [];
    _facebookNode?.dispose();
    _instagramNode?.dispose();
    _linkedinNode?.dispose();
    _websiteNode?.dispose();
  }
  var key = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    var categories = Provider.of<CategoryProvider>(context, listen: false).categories;

    return Form(
        key: key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //image
            const SizedBox(height: 15,),
            const Text('Photo de couverture', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE, fontWeight: FontWeight.bold),),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                image: photoCouverture != null ? DecorationImage(image: FileImage(photoCouverture!), fit: BoxFit.cover) :
                (widget.boutique.coverImage != null ? DecorationImage(image: NetworkImage(widget.boutique.coverImage!), fit: BoxFit.cover) : null),
              ),
              child: IconButton(
                icon: const Icon(Icons.add_a_photo, color: Colors.black,),
                onPressed: (){
                  showDialog(
                    context: context,
                    builder: (context) =>  AlertDialog(
                      content: SizedBox(
                        height: 250,
                        width: double.infinity*0.9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15,),
                            const Text('Veuillez choisir une source', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE),),
                            const SizedBox(height: 15,),
                            TextButton(
                              onPressed: (){
                                pickImageCover();
                                Navigator.pop(context);
                              },
                              child: const Text('Via Gallery', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE),),
                            ),
                            const SizedBox(height: 15,),
                            TextButton(
                              onPressed: (){
                                pickImageCover(imageSource: ImageSource.camera);
                                //close dialog
                                Navigator.pop(context);
                              },
                              child: const Text('Via Appareil Photo', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE),),
                            ),

                          ],
                        ),
                      ),
                    ),
                  );

                },
              ),
            ),
            //list images
            const SizedBox(height: 15,),
            const Text('Photo de profile', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE, fontWeight: FontWeight.bold),),

            SizedBox(
              height: 150,
              child:  Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 100,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  image: photoProfile != null ? DecorationImage(image: FileImage(photoProfile!), fit: BoxFit.cover) :
                  (widget.boutique.profilImage != null ? DecorationImage(image: NetworkImage(widget.boutique.profilImage!), fit: BoxFit.cover) : null),
                ),
                child: IconButton(
                  icon: const Icon(Icons.add_a_photo, color: Colors.black, size: 40,),
                  onPressed: (){
                    showDialog(
                      context: context,
                      builder: (context) =>  AlertDialog(
                        content: SizedBox(
                          height: 250,
                          width: double.infinity*0.9,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 15,),
                              const Text('Veuillez choisir une source', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE),),
                              const SizedBox(height: 15,),
                              TextButton(
                                onPressed: (){
                                  pickImageProfile();
                                  Navigator.pop(context);
                                },
                                child: const Text('Via Gallery', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE),),
                              ),
                              const SizedBox(height: 15,),
                              TextButton(
                                onPressed: (){
                                  pickImageProfile(imageSource: ImageSource.camera);
                                  Navigator.pop(context);

                                },
                                child: const Text('Via Appareil Photo', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE),),
                              ),
                              const SizedBox(height: 15,),
                            ],
                          ),
                        ),
                      ),
                    );

                  },
                ),
              ),
            ),


            //mutiselect
            const SizedBox(height: 15,),
            MultiSelectDialogField(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: Colors.grey[200],
              ),

              initialValue: widget.boutique.secteurs?.map((e) => e.id).toList() ?? [],
              items: categories.map((e) => MultiSelectItem(e.id, e.name!)).toList(),
              listType: MultiSelectListType.CHIP,
              buttonText: Text('Secteur d\'activité'),
              validator: (value) {
                if (value == null) {
                  return 'Veuillez choisir un secteur';
                }if(value.isEmpty){
                  return 'Veuillez choisir un secteur';
                }
                return null;
              },
              title: const Text('Veuillez choisir les categories', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE, fontWeight: FontWeight.bold),),
              onConfirm: (values) {
                _selectedItems = values;
              },
            ),


            //nom boutique
            Container(
              margin: const EdgeInsets.only(bottom: 15, top: 15),
              child: TextFormField(
                controller: _nomBoutiqueController,

                focusNode: _nomBoutiqueNode,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: "nom boutique",
                  hintText: "nom boutique",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),

                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Nom de boutique requis";
                  }
                  return null;
                },
              ),
            ),
            //latitude
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: TextFormField(
                controller: _latitudeController,
                onEditingComplete: (){
                  // Once user click on Next then it go to password field
                  _longitudeNode!.requestFocus();
                },
                focusNode: _latitudeNode,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: "latitude",
                  hintText: "latitude",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),

                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "latitude requise";
                  }
                  return null;
                },
              ),
            ),

            //longitude
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: TextFormField(
                controller: _longitudeController,
                onEditingComplete: (){
                  // Once user click on Next then it go to password field
                  _facebookNode!.requestFocus();
                },
                focusNode: _longitudeNode,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: "longitude",
                  hintText: "longitude",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),

                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "longitude requise";
                  }
                  return null;
                },
              ),
            ),

            //facebook
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: TextFormField(
                controller: _facebookController,
                onEditingComplete: (){
                  // Once user click on Next then it go to password field
                  _instagramNode!.requestFocus();
                },
                focusNode: _facebookNode,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: "facebook",
                  hintText: "facebook",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                ),
              ),
            ),

            //instagram
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: TextFormField(
                controller: _instagramController,
                onEditingComplete: (){
                  // Once user click on Next then it go to password field
                  _linkedinNode!.requestFocus();
                },
                focusNode: _instagramNode,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: "instagram",
                  hintText: "instagram",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                ),

              ),
            ),

            //linkedin
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: TextFormField(
                controller: _linkedinController,
                onEditingComplete: (){
                  // Once user click on Next then it go to password field
                  _websiteNode!.requestFocus();
                },
                focusNode: _linkedinNode,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: "linkedin",
                  hintText: "linkedin",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                ),
              ),
            ),

            //website
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: TextFormField(
                controller: _websiteController,
                onEditingComplete: (){
                  // Once user click on Next then it go to password field
                  _descriptionNode!.requestFocus();
                },
                focusNode: _websiteNode,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: "site web",
                  hintText: "site web",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                ),
              ),
            ),

            //description textFormField textarea
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: TextFormField(
                controller: _descriptionController,
                focusNode: _descriptionNode,
                textInputAction: TextInputAction.send,
                minLines: 3,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: "biographie de la boutique",
                  hintText: "biographie de la boutique(300 caractere max)",
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "biographie de la boutique requise";
                  }
                  return null;
                },
              ),
            ),

            //submit button
            Provider.of<VendorProvider>(context, listen: true ).isUpdateBoutiqueLoading ?
            const Center(child: CustomAppLoader())
                : ElevatedButton(
              child:  SizedBox(width: double.infinity, child:
              Center(child: Text(widget.boutique.id != null ? "Enregistrer" :'Enregistrer', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_LARGE, fontWeight: FontWeight.bold),),),),
              onPressed: () {

                if (key.currentState!.validate()) {
                  key.currentState?.save();
                  List<File> files = [];

                  if(photoProfile != null){
                    files.add(photoProfile!);
                  }
                  if(photoCouverture != null){
                    files.add(photoCouverture!);
                  }
                  BoutiqueUpdateModel boutiqueUpdateModel = BoutiqueUpdateModel(
                    name: _nomBoutiqueController.text,
                    latitude: (_latitudeController.text),
                    longitude: (_longitudeController.text),
                    bio: _descriptionController.text,
                    secteursId: _selectedItems.cast(),
                    facebook: _facebookController.text ?? "",
                    instagram: _instagramController.text ?? "",
                    linkedin: _linkedinController.text ?? "",
                    website: _websiteController.text ?? "",
                  );
                  updateBoutiqueForm(boutiqueUpdateModel , photoProfile, photoCouverture);
                }
              },
            ),
            SizedBox(height: 150,),

          ],
        ));
  }




  Future pickImageProfile({ImageSource imageSource = ImageSource.gallery}) async {
    try {
      final photoProfile = (await ImagePicker().pickImage(source: imageSource, imageQuality: 100, ));
      if(photoProfile == null) return;
      final imageTemp = File(photoProfile.path);
      setState(() => this.photoProfile = imageTemp);
    } on PlatformException catch(e) {
      AppHelper.showInfoFlushBar(context, e.message ?? 'Une erreur est survenue');
    }
  }

  Future pickImageCover({ImageSource imageSource = ImageSource.gallery}) async {
    try {
      final photoCouverture = (await ImagePicker().pickImage(source: imageSource, imageQuality: 100, ));
      if(photoCouverture == null) return;
      final imageTemp = File(photoCouverture.path);
      setState(() => this.photoCouverture = imageTemp);
    } on PlatformException catch(e) {
      AppHelper.showInfoFlushBar(context, e.message ?? 'Une erreur est survenue');
    }
  }


}



