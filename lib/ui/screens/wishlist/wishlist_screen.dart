import 'package:flutter/material.dart';
import 'package:wantermarket/ui/basewidgets/produit_by_boutique_2.dart';
import '../../../config/app_dimenssions.dart';

import '../../basewidgets/app_bars/app_bar_with_return_type2.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: appBarWithReturnType2(title: 'Liste d\'envies', context: context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Text('Liste d\'envies', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: Padding(
              padding : const EdgeInsets.only(left: 15.0, right: 15.0),
              child: GridView.builder(
                itemCount: 10,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 330
                  ),
                  itemBuilder: (context, index){
                    return ProductByBoutique2(id: index);
                  }
              ),
            ),
          )
        ],
      ),
    ));
  }
}
