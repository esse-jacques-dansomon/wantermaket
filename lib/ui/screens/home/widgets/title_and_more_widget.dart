import 'package:flutter/material.dart';

import '../../../../config/app_colors.dart';
import '../../../../route/routes.dart';

class TitleAndMoreText extends StatelessWidget {
  final String moreText;
  final String title;
  final Widget widget;
  const TitleAndMoreText({
    Key? key, required this.widget, required this.moreText, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 25,right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, ), textAlign: TextAlign.start,),
          TextButton(onPressed: (){
            Navigator.pushNamed(context, AppRoutes.category);
          }, child:
          Row(
            children: const [
              Text('Voir Plus', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.FACEBOOK  ), textAlign: TextAlign.start,),
              SizedBox(width: 5,),
              Icon(Icons.arrow_forward_ios, size: 13,  color: AppColors.FACEBOOK,),
            ],
          ),
          ),
        ],
      ),
    );
  }
}
