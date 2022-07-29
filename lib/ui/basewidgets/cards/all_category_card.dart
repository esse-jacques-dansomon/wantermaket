import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../config/app_colors.dart';
import '../../../data/models/body/category.dart';
import '../../../route/routes.dart';

class AllCategoryCard extends StatelessWidget {
  final Category category ;
  const AllCategoryCard({
    Key? key,
    required this.category

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, AppRoutes.category, arguments: category);
      },
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: CachedNetworkImageProvider(category.imagePath!), opacity: 0.7,  colorFilter: const ColorFilter.mode(Colors.black, BlendMode.lighten),  fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(category.name!, style: const TextStyle(fontSize: 20, color: AppColors.WHITE, fontWeight: FontWeight.w400),),
              const SizedBox(height: 5,),
            ],
          ),
        ),
      ),
    );
  }
}
