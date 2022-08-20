import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/providers/boutique_provider.dart';
import '../../../basewidgets/cards/boutique_card.dart';

class BoutiquesExclusives extends StatelessWidget {

  const BoutiquesExclusives({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BoutiqueProvider>(
      builder: (BuildContext context, boutiqueExclusiveProvider, Widget? child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const TitleAndMoreText( title: 'Boutique Exlusives', moreText: 'Voir tous', widget:  SecteurScreen()),
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
        );
      },
    );
  }
}
