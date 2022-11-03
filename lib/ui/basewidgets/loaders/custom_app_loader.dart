import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wantermarket/config/app_colors.dart';

class CustomAppLoader extends StatelessWidget {
  const CustomAppLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //custom loader base on platform (android or ios)
    return Theme.of(context).platform == TargetPlatform.iOS
        ? const CupertinoActivityIndicator(color: AppColors.PRIMARY)
        : const CircularProgressIndicator(color: AppColors.PRIMARY);

  }
}
