import 'package:flutter/material.dart';

import '../../../config/app_colors.dart';

AppBar appBarWithReturn({required String title, required BuildContext context}){
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: AppColors.PRIMARY,
    elevation: 0,
    actions: [
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios, size: 22, color: AppColors.WHITE, ),
              onPressed: () => Navigator.pop(context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:  [
                SizedBox(width: MediaQuery.of(context).size.width*0.8 , child: Text(title, style: const TextStyle( fontSize: 20, color: AppColors.WHITE), textAlign: TextAlign.end, overflow: TextOverflow.ellipsis,)),
                const SizedBox(width: 15,)
              ],
            ),
          ],
        ),
      )
      //back round button

    ],
  );
}