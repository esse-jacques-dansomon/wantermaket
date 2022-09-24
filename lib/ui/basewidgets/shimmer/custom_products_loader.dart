import 'package:flutter/material.dart';
import 'package:wantermarket/ui/basewidgets/shimmer/shimmer_product.dart';

import '../../../shared/app_helper.dart';

class CustomProductsLoader extends StatelessWidget {
  final int count;
  final bool isGrid;
  final bool isScrollable;

  const CustomProductsLoader(
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
                crossAxisCount:
                    AppHelper.getCrossAxisCount(context, width: 230),
                mainAxisSpacing: 10,
                mainAxisExtent: 320,
                childAspectRatio: 1.5),
            itemBuilder: (context, index) {
              return ProductShimmer();
            })
        : Container(
            height: 315,
            child: ListView.separated(
                itemCount: this.count,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(width: 10),
                itemBuilder: (BuildContext context, int index) =>
                    ProductShimmer()),
          );
  }
}
