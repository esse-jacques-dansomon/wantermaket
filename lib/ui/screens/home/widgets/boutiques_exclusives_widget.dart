import 'package:flutter/material.dart';
import '../../../basewidgets/boutique_card.dart';

class BoutiquesExclusives extends StatelessWidget {
  const BoutiquesExclusives({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const TitleAndMoreText( title: 'Boutique Exlusives', moreText: 'Voir tous', widget:  SecteurScreen()),
        Container(
          height: 155,
          margin: const EdgeInsets.only(left: 15, right: 15),
          child: ListView.separated(
            itemCount: 8,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (BuildContext context, int index) => SizedBox(width: 5,),
            itemBuilder: (BuildContext context, int index) => BoutiqueCard(id : index),
          ),
        ),
      ],
    );
  }
}
