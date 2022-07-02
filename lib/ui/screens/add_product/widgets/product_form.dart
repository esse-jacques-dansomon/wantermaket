import 'package:flutter/material.dart';

import '../../../../config/app_dimenssions.dart';

class ProductAddForm extends StatelessWidget {
  const ProductAddForm({Key? key}) : super(key: key);

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
            const Text('Image Principale', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE, fontWeight: FontWeight.bold),),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: IconButton(
                icon: const Icon(Icons.add_a_photo, color: Colors.black,),
                onPressed: (){
                  //pick image from galery or camera

                },
              ),
            ),
            //list images
            const SizedBox(height: 15,),
            const Text('Images Secondaires', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE, fontWeight: FontWeight.bold),),
            SizedBox(
              height: 150,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      height: 100,
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
            SizedBox(height: 15,),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Sous Categorie",
                hintText: "sous Categorie",
                border: OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),

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
