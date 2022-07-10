import 'package:flutter/material.dart';
import 'package:wantermarket/config/app_dimenssions.dart';
import 'package:wantermarket/ui/basewidgets/app_bars/app_bar_with_return.dart';

import '../../../config/app_colors.dart';

class BecomeExclusiveScreen extends StatelessWidget {
  const BecomeExclusiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithReturn(title: 'Devenir Exclusive', context: context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                Text('Devenez Exclusive', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: AppColors.BLACK),),
                SizedBox(height: 15,),
                Text('Envoyez votre demande pour passez exclusive. Notre equipe va prendre un certain temps pour traiter votre demande. ', textAlign: TextAlign.center, style: TextStyle(fontSize: AppDimensions.FONT_SIZE_DEFAULT, fontWeight: FontWeight.bold,color: Colors.grey),),
                SizedBox(height: 15,),
                Text('50.000 F CFA / 30 jours', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: AppColors.BLACK),),
                SizedBox(height: 15,),
                ElevatedButton(onPressed: (){}, child: Text('Envoyer la demande'))


              ],
            ),
          ),
        ),
      )
    );
  }
}
