import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/providers/boutique_provider.dart';
import 'package:wantermarket/ui/basewidgets/loaders/custom_app_loader.dart';
import 'package:wantermarket/ui/screens/home/widgets/boutiques_exclusives_widget.dart';

import '../../../basewidgets/cards/boutique_card.dart';

class TopBoutiquesWidget extends StatelessWidget {
  const TopBoutiquesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.only(left: 15.0, top: 25,right: 10, bottom: 20),
          child:Text('Top Boutiques', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, ), textAlign: TextAlign.start,),
        ),        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Consumer<BoutiqueProvider>(
              builder: (context, boutiqueProvider, child){
                switch(boutiqueProvider.topBoutiqueState){
                  case TopBoutiqueState.loading:
                    return SizedBox(
                      height: 310,
                      child: GridView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) => BoutiqueExclusiveShimmer(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1,
                          mainAxisExtent: 140,
                        ),
                      ),
                    );
                  case TopBoutiqueState.initial:
                    return const Center(child: CustomAppLoader());
                  case TopBoutiqueState.loaded:
                    return  boutiqueProvider.topBoutiques.isNotEmpty ? SizedBox(
                      height: 310,
                      child: GridView.builder(
                        itemCount: boutiqueProvider.topBoutiques.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) =>
                            BoutiqueCard(boutique: boutiqueProvider.topBoutiques[index],),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1,
                          mainAxisExtent: 140,
                        ),
                      ),
                    ): const Center(child: Text('Pas de boutique disponible'),);
                  case TopBoutiqueState.error:
                    return const Center(child: Text('Error'));
                }
              }
          ),
        ),
      ],
    );
  }
}
