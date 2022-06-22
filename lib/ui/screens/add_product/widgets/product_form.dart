import 'package:flutter/material.dart';

class ProductAddForm extends StatelessWidget {
  const ProductAddForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var key = GlobalKey<FormState>();
    return Form(
        key: key,
        child: Column(
          // description
          // categorie
          // sous Categorie
          // image de base:
          // images :
          children: [
            TextFormField(
              decoration: InputDecoration(
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
            SizedBox(height: 15,),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Prix du produit",
                hintText: "Prix du produit",
                border: OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),

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
            SizedBox(height: 15,),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Prix promotionnel",
                hintText: "Prix promotionnel",
                border: OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),

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
            SizedBox(height: 15,),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Categorie",
                hintText: "Categorie",
                border: OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),

              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Veuillez choisir une categorie";
                }
                return null;
              },
            ),

            //sous categorie
            SizedBox(height: 15,),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Sous Categorie",
                hintText: "sous Categorie",
                border: OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),

              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Veuillez choisir une categorie";
                }
                return null;
              },
            ),

            //
            SizedBox(height: 15,),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Sous Categorie",
                hintText: "sous Categorie",
                border: OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),

              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Veuillez choisir une categorie";
                }
                return null;
              },
            ),


            //description textFormField textarea
            SizedBox(height: 15,),
            TextFormField(
              minLines: 3,
              maxLines: 5,
              decoration: InputDecoration(
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

            //upload image
            






          ],
        ));
  }
}
