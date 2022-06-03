import 'package:flutter/material.dart';

class BoutiqueCard extends StatelessWidget {
  final int id;
  const BoutiqueCard({
    Key? key, required this.id,
  }) : super(key: key, );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        margin: const EdgeInsets.only(right: 10.0),
        height: 80,
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: SizedBox(
                width: 100,
                child: Image.network(
                  'https://picsum.photos/250?image=${id*11}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
              width: 110,
              child: Padding(
                padding: EdgeInsets.only(top: 5, left: 5),
                child: Text('Boutique de pretes porter ',overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17 ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
