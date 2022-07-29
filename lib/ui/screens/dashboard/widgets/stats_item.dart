import 'package:flutter/cupertino.dart';

import '../../../../config/app_colors.dart';

class StatItem extends StatelessWidget {
  final String name; final int value;
  const StatItem({
    Key? key,
    required this.name, required this.value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:  [
          Text('$value', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.PRIMARY),),
          const SizedBox(height: 7,),
          Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.PRIMARY),),
        ],
      ),
    );
  }
}
