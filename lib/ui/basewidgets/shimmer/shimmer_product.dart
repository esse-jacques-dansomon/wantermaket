import 'package:flutter/material.dart';

import 'custom_shimmer.dart';


class ProductShimmer extends StatelessWidget {
  const ProductShimmer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 230,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: CustomShimmer(height: 230)),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomShimmer(height: 15),
                  const SizedBox(height: 5),
                  CustomShimmer(height: 15),
                  // contact button
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 7,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:  [
                              //localisation icon
                              Container(width: 30 , child: CustomShimmer(height: 15),),
                              const SizedBox(width: 8,),
                              Expanded(child: CustomShimmer(height: 15))
                            ],
                          ) ,
                          const SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:  [
                              //localisation icon
                              Container(width: 30 , child: CustomShimmer(height: 15),),
                              const SizedBox(width: 8,),
                              Expanded(child: CustomShimmer(height: 15))
                            ],
                          ) ,
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: CustomShimmer(height: 15),),
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            color: Colors.grey[200],
                            width: 50,
                            child:CustomShimmer(height: 15),
                          )
                        ],
                      )
                    ],
                  )

                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}
