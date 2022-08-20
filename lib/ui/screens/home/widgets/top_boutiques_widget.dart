import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/providers/boutique_provider.dart';
import 'package:wantermarket/ui/screens/home/widgets/title_and_more_widget.dart';

import '../../../../route/routes.dart';
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
        const TitleAndMoreText( title: 'Top Boutiques', moreText: 'Voir toutes', route:  AppRoutes.search),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: SizedBox(
            height: 310,
            child: Consumer<BoutiqueProvider>(
              builder: (context, boutiqueProvider, child){
                return GridView.builder(
                  itemCount: boutiqueProvider.boutiquesExclusives.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) =>
                  BoutiqueCard(boutique: boutiqueProvider.boutiquesExclusives[index],),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1,
                    mainAxisExtent: 140,
                  ),
                );
              }
            ),
          ),
        ),
      ],
    );
  }
}
