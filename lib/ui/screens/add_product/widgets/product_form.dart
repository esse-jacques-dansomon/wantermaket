import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wantermarket/data/models/body/product.dart';

import '../../../../config/app_dimenssions.dart';

class ProductAddForm extends StatefulWidget {
  const ProductAddForm({Key? key}) : super(key: key);

  @override
  State<ProductAddForm> createState() => _ProductAddFormState();
}

class _ProductAddFormState extends State<ProductAddForm> {
  File? image;

  Future pickImage({ImageSource imageSource = ImageSource.gallery}) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource, imageQuality: 100, );
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var key = GlobalKey<FormState>();
    return Form(
        key: key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //image
            const SizedBox(height: 15,),
            const Text('Image Principale', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE),),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: MediaQuery.of(context).size.width*0.8,
              width: MediaQuery.of(context).size.width*0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: Colors.grey[200],
                image: image != null ? DecorationImage(image: FileImage(image!), fit: BoxFit.cover) : null,
              ),
              child: IconButton(
                icon: const Icon(Icons.add_a_photo, color: Colors.black,size: 100,),
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
                                onPressed: () => pickImage(),
                                child: const Text('Via Gallery', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE),),
                              ),
                              const SizedBox(height: 15,),
                              TextButton(
                                onPressed: () => pickImage(imageSource: ImageSource.camera),
                                child: const Text('Via Appareil Photo', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE),),
                              ),
                              const SizedBox(height: 15,),
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Annuler', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE),),
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
            const Text('Images Secondaires', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE),),
            SizedBox(
              height: 210,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],
                      ),
                      child: IconButton(
                        icon: Icon(Icons.add_a_photo, color: Colors.black,),
                        onPressed: (){},
                      ),
                    );
                  },
                  separatorBuilder: (context, index){
                    return SizedBox(width: 10,);
                  },
                  itemCount: 3
              ),
            ),
            const SizedBox(height: 15,),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Nom du produit",
                hintText: "Nom du produit",
                border: OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Veuillez entrer un nom de produit";
                }
                return null;
              },
            ),
            //price
            const SizedBox(height: 15,),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Prix du produit",
                hintText: "Prix du produit",

                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),

              ),

              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Veuillez entrer un prix de produit";
                }
                return null;
              },
            ),
            //prix promotionnel
            const SizedBox(height: 15,),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Prix promotionnel",
                hintText: "Prix promotionnel",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),

              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Veuillez entrer un prix de produit";
                }
                return null;
              },
            ),

            //categorie
            const SizedBox(height: 15,),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Categorie",
                hintText: "Categorie",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),

              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Veuillez choisir une categorie";
                }
                return null;
              },
            ),

            //sous categorie
            const SizedBox(height: 15,),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Sous Categorie",
                hintText: "sous Categorie",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),

              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Veuillez choisir une categorie";
                }
                return null;
              },
            ),


            //description textFormField textarea
            const SizedBox(height: 15,),
            TextFormField(
              minLines: 3,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: "Description",
                hintText: "Description",
                alignLabelWithHint: true,
                border: OutlineInputBorder(),

              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Veuillez choisir une categorie";
                }
                return null;
              },
            ),

            //submit button
            const SizedBox(height: 15,),
            ElevatedButton(
              child: const SizedBox(width: double.infinity, child:  Center(child: Text('Ajouter Le produit', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_LARGE, fontWeight: FontWeight.bold),),),),
              onPressed: () {
                if (key.currentState!.validate()) {
                  key.currentState?.save();
                }
              },
            ),

          ],
        ));
  }
}
