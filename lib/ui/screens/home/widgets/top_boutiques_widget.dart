import 'package:flutter/material.dart';
import 'package:wantermarket/ui/screens/home/widgets/title_and_more_widget.dart';

import '../../../basewidgets/boutique_card.dart';
import '../../sector/secteur_screen.dart';

class TopBoutiquesWidget extends StatelessWidget {
  const TopBoutiquesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleAndMoreText( title: 'Top Boutiques', moreText: 'Voir toutes', widget:  SecteurScreen()),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: SizedBox(
            height: 310,
            child: GridView.builder(
              itemCount: 14,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) => BoutiqueCard(id : index),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
                mainAxisExtent: 150,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
