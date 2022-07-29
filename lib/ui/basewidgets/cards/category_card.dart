import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wantermarket/data/models/body/category.dart';
import 'package:wantermarket/route/routes.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final bool categoriesPage;
  const CategoryCard({Key? key, this.categoriesPage=false,  required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          Navigator.pushNamed(context, AppRoutes.category, arguments: category);
        },
        child: SizedBox(
          width: !categoriesPage ? 80: 110,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(imageUrl: category.imagePath!,
                placeholder: (context, url) =>  Shimmer.fromColors(baseColor: Colors.grey.shade100, highlightColor: Colors.grey.shade100 ,  child:  SizedBox(width: !categoriesPage ?75: 100,
                  height: !categoriesPage ?75: 100,)),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
                imageBuilder: (context, imageProvider) => Container(
                  width: !categoriesPage ?75: 100,
                  height: !categoriesPage ?75: 100,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular( !categoriesPage ?50:0)),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5,),
               Expanded(
                child: Text(
                  category.name!, textAlign: TextAlign.start,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis

                  ),
                ),
              ),
              const SizedBox(height: 10,),

            ],
          ),
        ),
    );
  }
}
