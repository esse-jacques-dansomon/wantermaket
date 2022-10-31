import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppLoader extends StatelessWidget {
  const CustomAppLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //custom loader base on platform (android or ios)
    return Center(
      child: Theme.of(context).platform == TargetPlatform.iOS
          ? const CupertinoActivityIndicator()
          : const CircularProgressIndicator(),
    );

  }
}
