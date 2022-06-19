import 'package:flutter/material.dart';
import 'package:wantermarket/route/routes.dart';

class CategoryCard extends StatelessWidget {
  final int id;
  const CategoryCard({Key? key,  required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          Navigator.pushNamed(context, AppRoutes.category);
        },
        child: Container(
          width: 75,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 65,
                  height: 65,
                  decoration:  BoxDecoration(
                    borderRadius:const BorderRadius.all(Radius.circular(50)),
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
