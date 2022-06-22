import 'package:flutter/material.dart';
import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/config/app_dimenssions.dart';
import 'package:wantermarket/route/routes.dart';

import '../../basewidgets/app_bars/app_bar_with_return.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: appBarWithReturn(title: 'Notifications', context: context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index){
              return Dismissible(

                key: Key(index.toString()),
                child: Container(
                  margin: const EdgeInsets.symmetric( vertical: 5),
                  padding: const EdgeInsets.symmetric(horizontal:15),
                  color: Colors.grey[300],
                  height: 110,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: SizedBox(
                              height: 50,
                              width: 50,
                              child: Image.network('', fit: BoxFit.cover,),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Amama', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE, color: AppColors.BLACK, fontWeight: FontWeight.w300),),
                              SizedBox(height: 5,),
                              Text('jute de publier un nouveau produit')
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          TextButton(onPressed: (){}, child: Text('Voir', style: TextStyle(color: AppColors.SECONDARY),)),
                          TextButton(onPressed: (){}, child: Text('Archiver', style: TextStyle(color: AppColors.SECONDARY),))
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    ));
  }
}
