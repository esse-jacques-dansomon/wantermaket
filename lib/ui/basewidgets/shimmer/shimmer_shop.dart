import 'package:flutter/material.dart';
import 'package:wantermarket/ui/basewidgets/shimmer/custom_shimmer.dart';

class ShimmerShop extends StatelessWidget {
  const ShimmerShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shadowColor: Colors.black,
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                // height: 70,
                width: MediaQuery.of(context).size.width/2,
                child: CustomShimmer(height: 100,),

              ),
            ),
            const SizedBox(height: 10,),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 10), child: Column(
              children: [
                Row(
                  children: [
                    Container(width: 20,child: CustomShimmer(height: 20,),),
                    const SizedBox(width: 10,),
                    Expanded(child: CustomShimmer(height: 20,)),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      //call button
                      Container(
                        width: 40,
                        height: 25,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: CustomShimmer(height: 25,),
                      ),
                      Container(
                        width: 40,
                        height: 25,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: CustomShimmer(height: 25,),
                      ),
                      Container(
                        width: 40,
                        height: 25,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: CustomShimmer(height: 25,),
                      ),

                      //whatsapp button

                    ]
                ),
                SizedBox(height: 7,),

              ],
            ),),
          ],
        ));
  }
}
