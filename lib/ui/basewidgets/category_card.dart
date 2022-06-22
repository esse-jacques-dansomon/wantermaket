import 'package:flutter/material.dart';
import 'package:wantermarket/route/routes.dart';

class CategoryCard extends StatelessWidget {
  final int id;
  final bool categoriesPage;
  const CategoryCard({Key? key,  required this.id, this.categoriesPage=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          Navigator.pushNamed(context, AppRoutes.category);
        },
        child: Container(
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
                        'https://picsum.photos/250?image=${id*12}',
                      ),
                      fit: BoxFit.cover,
                    ),
              ),
              ),
              const SizedBox(height: 5,),
              const Expanded(
                child: Text(
                  'Electronique & Manager', textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyle(
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
