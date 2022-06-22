import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../route/routes.dart';

class AllCategoryCard extends StatelessWidget {
  final int index ;
  const AllCategoryCard({
    Key? key,
    required this.index

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, AppRoutes.category);
      },
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image:  Image.network('https://picsum.photos/250?image=${index*11}',).image, opacity: 0.7,  colorFilter: const ColorFilter.mode(Colors.black, BlendMode.lighten),  fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Category $index', style: const TextStyle(fontSize: 20, color: AppColors.WHITE, fontWeight: FontWeight.w400),),
              const SizedBox(height: 5,),
              Text('Description de la category $index', style: const TextStyle(fontSize: 15,color: AppColors.WHITE),),
            ],
          ),
        ),
      ),
    );
  }
}
