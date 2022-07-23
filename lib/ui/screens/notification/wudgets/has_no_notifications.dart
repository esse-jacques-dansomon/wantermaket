import 'package:flutter/material.dart';

import '../../../../config/app_colors.dart';
import '../../../../config/app_dimenssions.dart';
import '../../../../route/routes.dart';

class NoNotificationWidget extends StatelessWidget {
  const NoNotificationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:   [
        const ClipOval(
          child:  SizedBox(
            height: 100,
            width: 100,
            child: Icon(Icons.notifications, color: AppColors.PRIMARY, size: 100, ),
          ),
        ),
        const SizedBox(height: 10,),
        const Text('Aucune Notifications', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE),),
        const SizedBox(height: 10,),
        ElevatedButton(
            onPressed: (){
              Navigator.popAndPushNamed(context, AppRoutes.hasNotification);
            },
            child:const  SizedBox( child: Text('Paramettres'),
            ))

      ],
    );
  }
}
