import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:provider/provider.dart';

import '../../../../config/app_colors.dart';
import '../../../../config/app_dimenssions.dart';
import '../../../../providers/category_provider.dart';

class BoutiqueForm extends StatefulWidget {
  const BoutiqueForm({Key? key}) : super(key: key);

  @override
  State<BoutiqueForm> createState() => _BoutiqueFormState();
}

class _BoutiqueFormState extends State<BoutiqueForm> {

  Future pickImageProfile({ImageSource imageSource = ImageSource.gallery}) async {
    try {
      final photoProfile = (await ImagePicker().pickImage(source: imageSource, imageQuality: 100, ));
      if(photoProfile == null) return;
      final imageTemp = File(photoProfile.path);
      setState(() => this.photoProfile = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }


  Future pickImageCover({ImageSource imageSource = ImageSource.gallery}) async {
    try {
      final photoCouverture = (await ImagePicker().pickImage(source: imageSource, imageQuality: 100, ));
      if(photoCouverture == null) return;
      final imageTemp = File(photoCouverture.path);
      setState(() => this.photoCouverture = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  String? _nomBoutique, _latitude, _longitude, _description;
  FocusNode? _nomBoutiqueNode, _latitudeNode, _longitudeNode, _descriptionNode;


  List<dynamic> _selectedItems = [];
  File? photoCouverture, photoProfile ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nomBoutiqueNode = FocusNode();
    _latitudeNode = FocusNode();
    _longitudeNode = FocusNode();
    _descriptionNode = FocusNode();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nomBoutiqueNode?.dispose();
    _latitudeNode?.dispose();
    _longitudeNode?.dispose();
    _descriptionNode?.dispose();

  }

  @override
  Widget build(BuildContext context) {

    var categories = Provider.of<CategoryProvider>(context, listen: false).categories;



    void addProduct(){

    }

    var key = GlobalKey<FormState>();
    return Form(
        key: key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //image
            const SizedBox(height: 15,),
            const Text('photo de couverture', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE, fontWeight: FontWeight.bold),),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
                image: photoCouverture != null ? DecorationImage(image: FileImage(photoCouverture!), fit: BoxFit.cover) : null,
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
            const Text('photo de profil', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE, fontWeight: FontWeight.bold),),

            SizedBox(
              height: 150,
              child:  Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 100,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                  image: photoProfile != null ? DecorationImage(image: FileImage(photoProfile!), fit: BoxFit.cover) : null,
                ),
                child: IconButton(
                  icon: const Icon(Icons.add_a_photo, color: Colors.black, size: 60,),
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
                              // TextButton(
                              //   onPressed: () => Navigator.pop(context),
                              //   child: const Text('Annuler', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE),),
                              // ),
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

              items: categories.map((e) => MultiSelectItem(e.id, e.name!)).toList(),
              listType: MultiSelectListType.CHIP,
              buttonText: Text('Secteur d\'activité'),
              validator: (value) {
                if (value == null) {
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
                onSaved: (value) => _nomBoutique = value!,
                onEditingComplete: (){
                  // Once user click on Next then it go to password field
                  _latitudeNode!.requestFocus();
                },
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
                onTap: (){},
              ),
            ),
            //latitude
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: TextFormField(
                onSaved: (value) => _latitude = value!,
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
                onSaved: (value) => _longitude = value!,
                onEditingComplete: (){
                  // Once user click on Next then it go to password field
                  _descriptionNode!.requestFocus();
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

            //description textFormField textarea
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: TextFormField(
                onSaved: (value) => _description = value!,
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
            ElevatedButton(
              child: const SizedBox(width: double.infinity, child:  Center(child: Text('Enregistrer', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE, fontWeight: FontWeight.bold),),),),
              onPressed: () {
                if (key.currentState!.validate()) {
                  key.currentState?.save();
                  print("$_nomBoutique, $_latitude, $_longitude, $_description, $_selectedItems");
                }
              },
            ),

          ],
        ));
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
        onSaved: (value) => _nomBoutique = value!,
        onEditingComplete: (){
          // Once user click on Next then it go to password field
          _latitudeNode!.requestFocus();
        },
        focusNode: _nomBoutiqueNode,
        textInputAction: TextInputAction.next,



        // validator: requiredValidator,
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
      ),
    );
  }
  Widget _buildLatitudeField(){
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Veuillez entre votre latitude';
          }
          return null;
        },
        onSaved: (value) => _latitude = value!,
        onEditingComplete: (){
          // Once user click on Next then it go to password field
          _longitudeNode!.requestFocus();
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
          hintText: 'votre latitude',
          hintStyle: const TextStyle(color: AppColors.PRIMARY),
        ),
        focusNode: _latitudeNode,
      ),
    );
  }
  Widget _buildLongitudeField(){
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Veuillez entre votre longitude';
          }
          return null;
        },
        onSaved: (value) => _longitude = value!,
        onEditingComplete: (){
          // Once user click on Next then it go to password field
          _descriptionNode!.requestFocus();
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
          hintText: 'Votre logitude',
          hintStyle: const TextStyle(color: AppColors.PRIMARY),
        ),
        focusNode: _longitudeNode,
      ),
    );
  }

}



