import 'package:flutter/material.dart';
import 'package:wantermarket/ui/screens/boutique/widgets/secteur_card.dart';

class SecteurScreen extends StatelessWidget {
  const SecteurScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    //final cardSize = MediaQuery.of(context).size.width / 2 - 32;
    return SafeArea(
      child: Scaffold(
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
                'Retrouvez les boutiques par secteurs',
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
                           ),
                           itemBuilder: (context, index) {
                             return const SecteurCard();
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
