import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/providers/category_provider.dart';
import 'package:wantermarket/ui/screens/home/widgets/title_and_more_widget.dart';

import '../../../../route/routes.dart';
import '../../../basewidgets/cards/category_card.dart';
import '../../../basewidgets/shimmer/custom_shimmer.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, snapshot, child) {
        switch (snapshot.categoryState) {
          case CategoryState.initial:
            return Container();
          case CategoryState.loading:
            return Center(
              child: HomeCategoriesWidgetShimmer(),
            );
          case CategoryState.loaded:
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleAndMoreText( title: 'Categories', moreText: 'Voir Plus', route:  AppRoutes.categories),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: SizedBox(
                    height: 120,
                    child: ListView.separated(
                      separatorBuilder: ( context, int index) => const SizedBox(width: 25),
                      itemBuilder: ( context, int index) => CategoryCard(category : snapshot.categories[index]),
                      itemCount: snapshot.categories.length, scrollDirection: Axis.horizontal,),
                  ),
                ),
              ],
            );
          case CategoryState.error:
            return Center(
              child: Text('Error'),
            );
        }
      }
    );
  }
}

class HomeCategoriesWidgetShimmer extends StatelessWidget {
  const HomeCategoriesWidgetShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleAndMoreText( title: 'Categories', moreText: 'Voir Plus', route:  AppRoutes.categories),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: SizedBox(
            height: 130,
            child: ListView.separated(
              separatorBuilder: ( context, int index) => const SizedBox(width: 15),
              itemBuilder: ( context, int index) => Container(
                width: 120,
                child: Column(
                  children: [
                    CustomShimmer( height: 110,),
                    SizedBox(height: 10,),
                    CustomShimmer( height: 10,),
                  ],
                ),

              ),
              itemCount: 15, scrollDirection: Axis.horizontal,),
          ),
        ),
      ],
    );
  }
}



