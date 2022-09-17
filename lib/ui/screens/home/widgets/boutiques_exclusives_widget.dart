import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/providers/boutique_provider.dart';
import '../../../basewidgets/cards/boutique_card.dart';
import '../../../basewidgets/shimmer/custom_shimmer.dart';

class BoutiquesExclusives extends StatelessWidget {

  const BoutiquesExclusives({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BoutiqueProvider>(
      builder: (BuildContext context, boutiqueExclusiveProvider, Widget? child) {
        switch (boutiqueExclusiveProvider.state) {
          case BoutiqueState.initial:
            return const SizedBox();
          case BoutiqueState.loading:
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const TitleAndMoreText( title: 'Boutique Exlusives', moreText: 'Voir tous', widget:  SecteurScreen()),
                Container(
                  height: 147,
                  margin: const EdgeInsets.only(left: 10, right: 15, top: 20),
                  child: ListView.separated(
                    itemCount: 10,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 5,),
                    //shimmer
                    itemBuilder: (BuildContext context, int index) => BoutiqueExclusiveShimmer(),
                ),)
              ],
            );
          case BoutiqueState.loaded:
            return boutiqueExclusiveProvider.boutiquesExclusives.isNotEmpty ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 147,
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  child: ListView.separated(
                    itemCount: boutiqueExclusiveProvider.boutiquesExclusives.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 5,),
                    itemBuilder: (BuildContext context, int index) => BoutiqueCard(
                      boutique: boutiqueExclusiveProvider.boutiquesExclusives[index],
                    ),
                  ),
                ),
              ],
            ) :  Container(padding : EdgeInsets.only(top: 20) ,height: 50, child: Center(child: Text("Pas de boutiques exclusives"),),);
          case BoutiqueState.error:
            return const Center(child: Text('Error'));
        }
      },
    );
  }
}

class BoutiqueExclusiveShimmer extends StatelessWidget {
  const BoutiqueExclusiveShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 130,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            CustomShimmer(height: 10,),
            const SizedBox(height: 5,),
            CustomShimmer(height: 100,),
          ],
        ),
      ),
                  );
  }
}
