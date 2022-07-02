import 'package:flutter/material.dart';
import 'package:wantermarket/shared/app_helper.dart';
import 'package:wantermarket/ui/screens/home/widgets/title_and_more_widget.dart';

import '../../../basewidgets/produit_by_boutique_3.dart';
import '../../sector/secteur_screen.dart';

class NouveautesWidget extends StatelessWidget {
  const NouveautesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.only(left: 15.0, top: 25,right: 10),
          child:Text('Nouveautés', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, ), textAlign: TextAlign.start,),
        ),
        const SizedBox(height: 10,),
        GridView.builder(
            itemCount: 20,
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              //dynamic
                crossAxisCount: AppHelper.getCrossAxisCount(context, width: 230),
                mainAxisSpacing: 10,
                mainAxisExtent: 320,
                childAspectRatio: 1.5
            ),
            itemBuilder: (context, index){
              return ProductByBoutique3(id: index);
            }),
        const SizedBox(height: 15,),
      ],
    );
  }
}
