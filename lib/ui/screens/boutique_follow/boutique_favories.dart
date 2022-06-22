import 'package:flutter/material.dart';
import 'package:wantermarket/config/app_dimenssions.dart';

import '../../basewidgets/app_bars/app_bar_with_return_type2.dart';

class BoutiquesFavoriesScreen extends StatelessWidget {
  const BoutiquesFavoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: appBarWithReturnType2(title: 'Boutiques Favories', context: context),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: Text('Boutiques Favories', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding : const EdgeInsets.only(left: 15.0, right: 15.0),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 15,
                itemBuilder: (context, index){
                  return Container(
                    height: 70,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipOval(
                          child: SizedBox(
                            width: 55,
                            height: 55,
                            child: Image.network(
                              'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
                              fit: BoxFit.cover,
                            ),
                            ),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Boutique $index', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE, fontWeight: FontWeight.bold),),
                            // const SizedBox(height: 2,),
                            // Text('Mdeina Rue $index x ${index*5}', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_DEFAULT),),
                            const SizedBox(height: 5,),
                            Text('Mediana, Dakar, Sénegal',
                              style: TextStyle( fontSize: AppDimensions.FONT_SIZE_DEFAULT, ), maxLines: 2,  ),
                          ],
                        ),
                        Expanded(child: Container()),
                        //follow button
                        Container(
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black12,
                          ),
                          child: Center(
                            child: TextButton(
                              onPressed: (){},
                              child: Text('Suivre', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_DEFAULT, color: Colors.black),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index){
                  return const Divider(
                    height: 1,
                    color: Colors.grey,
                  );

                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
