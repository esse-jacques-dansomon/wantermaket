import 'package:flutter/material.dart';
import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/shared/contact_vendor.dart';

import '../../../data/models/body/boutique.dart';

class FicheVendeur extends StatelessWidget {
  final Boutique boutique;

  const FicheVendeur({
    Key? key, required this.boutique,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height*0.7,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(boutique.name!, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                InkWell(child: const Icon(Icons.close, size: 28, color: AppColors.SECONDARY,),
                  onTap: (){
                    Navigator.pop(context);
                  },),
              ],
            ),
            const SizedBox(height: 10,),
            const Text('Biographie', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            Text(boutique.bio!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
            const SizedBox(height: 10,),
            //Nom vendeur
            boutique.vendor?.name != '' ?
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Nom vendeur', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                const SizedBox(height: 5,),
                Text(boutique.vendor!.name!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                const SizedBox(height: 10,),
              ],
            ): Container(),

            //corrdonnees
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Coordonnees', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                const SizedBox(height: 5,),
                Row(
                  children:  [
                    const Icon(Icons.phone, size: 18,),
                    const SizedBox(width: 5,),
                    Text(boutique.vendor!.phone!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                  ],
                ),         const SizedBox(height: 5,),
                InkWell(
                  onTap: (){
                    ContactVendor.lauchWhastapp(boutique.vendor!.phone!, context);
                  },
                  child: Row(
                    children:  [
                      const Icon(Icons.whatsapp, size: 18,),
                      const SizedBox(width: 5,),
                      Text(boutique.vendor!.phone!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                    ],
                  ),
                ),
                const SizedBox(height: 5,),
                Row(
                  children:  [
                    const Icon(Icons.email, size: 18,),
                    const SizedBox(width: 5,),
                    Text(boutique.vendor!.email!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                  ],
                ),
              ],
            ),


            //onpen location in maps
            const SizedBox(height: 15,),
            ElevatedButton(onPressed: (){
              ContactVendor.launchMaps(boutique);
            }, child:const Text('Localisation') )

          ],
        ),
      ),
    );
  }
}
