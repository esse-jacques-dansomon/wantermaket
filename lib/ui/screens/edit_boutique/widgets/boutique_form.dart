import 'package:flutter/material.dart';

import '../../../../config/app_dimenssions.dart';

class BoutiqueForm extends StatelessWidget {
  const BoutiqueForm({Key? key}) : super(key: key);

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
            const Text('photo de couverture', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE, fontWeight: FontWeight.bold),),
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
                ),
                child: IconButton(
                  icon: Icon(Icons.add_a_photo, color: Colors.black,),
                  onPressed: (){},
                ),
              ),
            ),
            const SizedBox(height: 15,),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Secteur d'activité",
                hintText: "Secteur d'activité",
                border: OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Secteur d'activité requis";
                }
                return null;
              },
            ),
            //price
            const SizedBox(height: 15,),
            TextFormField(
              decoration: InputDecoration(
                labelText: "nom boutique",
                hintText: "nom boutique",
                border: OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),

              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Nom de boutique requis";
                }
                return null;
              },
            ),
            //prix promotionnel
            SizedBox(height: 15,),
            TextFormField(
              decoration: InputDecoration(
                labelText: "latitude",
                hintText: "latitude",
                border: OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),

              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return "latitude requise";
                }
                return null;
              },
            ),

            //categorie
            SizedBox(height: 15,),
            TextFormField(
              decoration: InputDecoration(
                labelText: "longitude",
                hintText: "longitude",
                border: OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),

              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return "longitude requise";
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

            //submit button
            const SizedBox(height: 15,),
            ElevatedButton(
              child: const SizedBox(width: double.infinity, child:  Center(child: Text('Enregistrer', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE, fontWeight: FontWeight.bold),),),),
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
