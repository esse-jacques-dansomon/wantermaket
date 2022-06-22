import 'package:flutter/material.dart';

import '../../../../route/routes.dart';

class SecteurCard extends StatelessWidget {
  const SecteurCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: (){
        Navigator.pushNamed(context, AppRoutes.boutiqueBySecteur);
      },
      child: Card(
        shadowColor: Colors.black,
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children: [
            Container(
              height: 75,
              width: 120,
              child: Image.asset(
                'assets/images/agroalimentaire.png', fit: BoxFit.cover,
              ),

            ),
            const  SizedBox(height: 10,),
            const Text('Agroalimentaria',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis,),
          ],
        ),
      ),
    );
    ;
  }
}
