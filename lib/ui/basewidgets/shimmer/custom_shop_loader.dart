import 'package:flutter/material.dart';
import 'package:wantermarket/ui/basewidgets/shimmer/shimmer_shop.dart';

import '../../../shared/app_helper.dart';

class CustomShopLoader extends StatelessWidget {
  final int count;
  final bool isGrid;
  final bool isScrollable;

  const CustomShopLoader(
      {super.key, required this.count, required this.isGrid, this.isScrollable =false});

  @override
  Widget build(BuildContext context) {
    return this.isGrid
        ? GridView.builder(
            itemCount: this.count,
           // padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            physics: this.isScrollable? const NeverScrollableScrollPhysics():BouncingScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //dynamic
                crossAxisCount: AppHelper.getCrossAxisCount(context, width: 190),
                crossAxisSpacing: 12,
                mainAxisSpacing: 8,
                childAspectRatio: 1.30,
                mainAxisExtent:190
            ),
            itemBuilder: (context, index) {
              return ShimmerShop();
            })
        : Container(
            height: 315,
            child: ListView.separated(
                itemCount: this.count,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(width: 10),
                itemBuilder: (BuildContext context, int index) =>
                    ShimmerShop()),
          );
  }
}
