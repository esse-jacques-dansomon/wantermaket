import 'package:flutter/material.dart';
import 'package:wantermarket/config/app_colors.dart';

import '../../basewidgets/app_bars/app_bar_with_return_type2.dart';

class AbonnementScreen extends StatelessWidget {
  const AbonnementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: appBarWithReturnType2(title: 'Abonnement', context: context),
      body: Padding(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const  Text('Mon Abonnement', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15,),
            Expanded(child: ListView.separated(
               physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border:  Border.all(
                          color: AppColors.SECONDARY,
                          width: 1
                      )
                    ),
                    child: Column(
                      children: [
                        Container(
                          color: AppColors.SECONDARY,
                          width: double.infinity,
                          height: 40,
                          child: const Center(child:  Text('Premier', style: TextStyle(fontSize: 22, color: AppColors.WHITE),)),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.fromLTRB(25, 25, 15, 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('# Validité : 1 mois', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                              Text('# Nombre de produits : 100', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                              Text('# Catégories : toutes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                              Text('# Localisation : disponible', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                              Text('# Publications sur les réseaux sociaux', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                              Text('# Deal du jour : 1', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                              Text('# Promo banner : 1', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1, color: AppColors.SECONDARY
                            )
                          ),
                          margin: const EdgeInsets.fromLTRB(25, 0, 25, 25),

                          child: TextButton(

                            onPressed: () {},
                            child: const Text('   Choisir le plan PREMIUM  ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                          )
                        ),


                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemCount: 3
            ))

          ],
        ),
      ),
    ));
  }
}
