import 'package:flutter/material.dart';
import '../../../config/app_dimenssions.dart';

import '../../basewidgets/app_bars/app_bar_with_return_type2.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: appBarWithReturnType2(title: 'Liste d\'envies', context: context),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: Text('Liste d\'envies', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding : const EdgeInsets.only(left: 15.0, right: 15.0),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 15,
                itemBuilder: (context, index){
                  return Container(
                    child: Row(
                      children: [
                        Image.network(
                          'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
                          fit: BoxFit.cover, width: 70, height: 70,),
                        const SizedBox(width: 15),
                        Column(
                          children: [
                            Text('Boutique $index', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE, fontWeight: FontWeight.bold),),

                            Row(
                              children: [

                              ],
                            )
                          ],
                        )

                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index){
                  return const SizedBox(height: 15,);

                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
