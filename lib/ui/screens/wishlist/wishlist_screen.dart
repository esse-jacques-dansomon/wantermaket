import 'package:flutter/material.dart';
import 'package:wantermarket/ui/basewidgets/app_bars/app_bar_with_return.dart';
import 'package:wantermarket/ui/basewidgets/produit_by_boutique_3.dart';

import '../../../shared/app_helper.dart';
import '../../basewidgets/app_bars/app_bar_with_return_type2.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: appBarWithReturn(title: 'Ma Liste d\'envies', context: context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
          //   child: Text('Liste d\'envies', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          // ),
          Expanded(
            child: Padding(
              padding : const EdgeInsets.only(left: 12.0, right: 12.0, top: 10),
              child: GridView.builder(
                itemCount: 10,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: AppHelper.getCrossAxisCount(context, width: 170),
                    childAspectRatio: 1,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 315
                  ),
                  itemBuilder: (context, index){
                    return ProductByBoutique3(id: index);
                  }
              ),
            ),
          )
        ],
      ),
    ));
  }
}
