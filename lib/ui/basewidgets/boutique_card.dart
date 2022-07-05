import 'package:flutter/material.dart';
import 'package:wantermarket/config/app_constantes.dart';

import '../../data/models/body/boutique.dart';
import '../../route/routes.dart';
import '../screens/boutique/boutique_details_screen.dart';

class BoutiqueCard extends StatelessWidget {
  final Boutique boutique;
  const BoutiqueCard({
    Key? key, required this.boutique,
  }) : super(key: key, );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, AppRoutes.vendor, arguments: boutique);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               SizedBox(
                width: 115,
                child: Padding(
                  padding: const EdgeInsets.only( left: 5),
                  child: Text(boutique.name!.toUpperCase(),overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,
                    style:const TextStyle(fontWeight: FontWeight.w400, fontSize: 16, ),
                    maxLines: 1,
                  ),
                ),
              ),
              const SizedBox(height: 8,),
              SizedBox(
                width: 112,
                child: Image.network(
                  boutique.profilImage!,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
