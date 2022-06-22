import 'package:flutter/material.dart';
import 'package:wantermarket/ui/screens/home/widgets/title_and_more_widget.dart';

import '../../../basewidgets/produit_by_boutique_2.dart';
import '../../sector/secteur_screen.dart';

class NouveautesWidget extends StatelessWidget {
  const NouveautesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleAndMoreText( title: 'Nouveautés', moreText: 'Voir Tous', widget:  SecteurScreen()),
        const SizedBox(height: 10,),
        GridView.builder(
            itemCount: 20,
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10, mainAxisExtent: 330),
            itemBuilder: (context, index){
              return ProductByBoutique2(id: index,);
            }),
        const SizedBox(height: 15,),
      ],
    );
  }
}
