import 'package:flutter/material.dart';

class SectorTitle extends StatelessWidget {
  const SectorTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 5),
          child: Text(
            "Nos secteurs",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15, top: 5 , bottom: 10, right: 15),
          child: Text(
            'Retrouvez les boutiques par secteurs',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
