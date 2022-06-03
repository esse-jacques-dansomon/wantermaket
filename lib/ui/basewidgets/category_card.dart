import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final int id;
  const CategoryCard({Key? key,  required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: SizedBox(
          height: 100,
          width: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Container(
                    decoration:  BoxDecoration(
                      borderRadius:const BorderRadius.all(Radius.circular(5)),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://picsum.photos/250?image=${id*12}',
                        ),
                        fit: BoxFit.cover,
                      ),
              ),
                ),
              ),
              const SizedBox(height: 5,),
              const Expanded(
                child: Text(
                  'Electroniques',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
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
