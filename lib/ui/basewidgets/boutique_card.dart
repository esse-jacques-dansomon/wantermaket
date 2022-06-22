import 'package:flutter/material.dart';

import '../screens/boutique/boutique_details_screen.dart';

class BoutiqueCard extends StatelessWidget {
  final int id;
  const BoutiqueCard({
    Key? key, required this.id,
  }) : super(key: key, );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => BoutiqueDetailsScreen()));
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 115,
              child: Padding(
                padding: EdgeInsets.only(top: 5, left: 5),
                child: Text('Boutique de pretes porter ',overflow: TextOverflow.ellipsis, textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, ),
                  maxLines: 1,
                ),
              ),
            ),
            const SizedBox(height: 5,),
            SizedBox(
              width: 115,
              child: Image.network(
                'https://picsum.photos/250?image=${id}',
                fit: BoxFit.cover,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
