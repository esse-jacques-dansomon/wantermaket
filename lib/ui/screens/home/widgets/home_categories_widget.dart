import 'package:flutter/material.dart';
import 'package:wantermarket/ui/screens/home/widgets/title_and_more_widget.dart';

import '../../../basewidgets/category_card.dart';
import '../../sector/secteur_screen.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleAndMoreText( title: 'Categories', moreText: 'Voir Plus', widget:  SecteurScreen()),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: SizedBox(
            height: 105,
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 15),
              itemBuilder: (BuildContext context, int index) => CategoryCard(id : index),
              itemCount: 8, scrollDirection: Axis.horizontal,),
          ),
        ),
      ],
    );
  }
}
