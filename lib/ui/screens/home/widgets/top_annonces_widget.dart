import 'package:flutter/material.dart';
import 'package:wantermarket/ui/basewidgets/produit_by_boutique_3.dart';
import 'package:wantermarket/ui/screens/home/widgets/title_and_more_widget.dart';

import '../../../basewidgets/produit_by_boutique.dart';
import '../../sector/secteur_screen.dart';

class TopAnnoncesWidget extends StatelessWidget {
  const TopAnnoncesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleAndMoreText( title: 'Top Annonces', moreText: 'Voir Plus', widget:  SecteurScreen()),
        Container(
          height: 315,
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: 8,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 10),
                  itemBuilder: (BuildContext context, int index) => Container(width:200, child: ProductByBoutique3(id : index)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
