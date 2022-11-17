import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../config/app_colors.dart';

AppBar appBarWithReturnType2({required String title, required BuildContext context}){
  return AppBar(
    systemOverlayStyle: SystemUiOverlayStyle(
      // Status bar color
      statusBarColor: AppColors.PRIMARY,

      // Status bar brightness (optional)
      statusBarIconBrightness: Brightness.light, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // For iOS (dark icons)
    ),
    automaticallyImplyLeading: false,
    backgroundColor: Colors.grey[50],
    elevation: 0,
    actions: [
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios, size: 22, color: AppColors.PRIMARY, ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      )
      //back round button

    ],
  );
}