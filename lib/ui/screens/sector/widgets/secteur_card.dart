import 'package:flutter/material.dart';
import 'package:wantermarket/data/models/body/category.dart';

import '../../../../route/routes.dart';

class SecteurCard extends StatelessWidget {
  final Category category;
  const SecteurCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: (){
        Navigator.pushNamed(context, AppRoutes.boutiqueBySecteur, arguments: category);
      },
      child: Card(
        shadowColor: Colors.black,
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 75,
              width: 120,
              child: Image.network(
                category.imagePath!,
                fit: BoxFit.cover,
              ),
              ),

            const  SizedBox(height: 10,),
            Text(category.name!,style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}
