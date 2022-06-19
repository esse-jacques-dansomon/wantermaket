import 'package:flutter/material.dart';
import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/data/fakedata/boutique_json.dart';
import 'package:wantermarket/ui/screens/boutique/widgets/boutique_card.dart';
import 'package:wantermarket/ui/screens/boutique/widgets/secteur_card.dart';

import '../../basewidgets/app_bars/app_bar.dart';
import '../../basewidgets/bottom_bar/bottom_nav_bar.dart';
import '../../basewidgets/boutique_card.dart';

class BoutiqueBySecteurScreen extends StatelessWidget {
  const BoutiqueBySecteurScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    //final cardSize = MediaQuery.of(context).size.width / 2 - 32;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: false,
          backgroundColor:AppColors.PRIMARY,
          title: const Text('Secteur Agroalimentaire', style: TextStyle(color: Colors.white),),
          iconTheme: const IconThemeData(color: Colors.white, size: 28),),
        bottomNavigationBar: const CustomBottomNavBar(boutique: true,),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //prendre la taille de l'écran
    
          children:  [
             const Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 5),
              child: Text(
                "Nos secteurs",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, top: 0, bottom: 10),
              child: Text(
                ' Retrouvez ici toutes les boutiques du secteur Electronique ',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
        Expanded(
             child: Padding(
               padding: const EdgeInsets.only(left: 10, right: 10),
               child: GridView.builder(
                           itemCount: 40,
                           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 8,
                              childAspectRatio: 1.30,
                              mainAxisExtent: 190
                           ),
                           itemBuilder: (context, index) {
                             return const BoutiqueCardBySecteur();
                           },
                         ),
             )
               ),
          ],
        ),
      ),
    );
  }
}
