import 'package:flutter/material.dart';
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
          Navigator.pushNamed(context, AppRoutes.category);
        },
        child: SizedBox(
          width: !categoriesPage ? 75: 110,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: !categoriesPage ?65: 100,
                  height: !categoriesPage ?65: 100,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular( !categoriesPage ?50:0)),
                    image: DecorationImage(
                      image: NetworkImage(
                        category.imagePath!,
                      ),
                      fit: BoxFit.cover,
                    ),
              ),
              ),
              const SizedBox(height: 5,),
               Expanded(
                child: Text(
                  category.name!, textAlign: TextAlign.start,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 16,
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
