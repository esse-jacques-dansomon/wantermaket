import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/providers/product_provider.dart';
import 'package:wantermarket/ui/screens/home/widgets/title_and_more_widget.dart';

import '../../../../config/app_colors.dart';
import '../../../../data/models/body/filter_model.dart';
import '../../../../route/routes.dart';
import '../../../basewidgets/cards/deal_du_jour_card.dart';
import '../../../basewidgets/shimmer/custom_shimmer.dart';

class DealDuJourWidget extends StatelessWidget {
  const DealDuJourWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndMoreText( title: 'En Promo', moreText: 'Voir Plus', route:  AppRoutes.search, filterModel: FilterModel(isPromo: 1),),
        Consumer<ProductProvider>(
          builder: (context, productProvider, child){
           switch (productProvider.dealsOfTheDayStatus) {
             case ProductDealOfTheDayStatus.initial:
             case ProductDealOfTheDayStatus.loading:
               return DealOfOfTheDayWidgetShimmer();
             case ProductDealOfTheDayStatus.loaded:
               return productProvider.dealsOfTheDay.length > 0 ?  SizedBox(
                 height: 510,
                 child: Swiper(
                   itemCount: productProvider.dealsOfTheDay.length,
                   itemBuilder: (BuildContext context, int index) {
                     return  Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Container(
                           margin: const EdgeInsets.only(left: 10, right: 10),
                           width: MediaQuery.of(context).size.width-20,
                           // padding: const EdgeInsets.only(bottom: 10),
                           decoration: BoxDecoration(
                             border : Border.all(color: AppColors.SECONDARY, width: 2),
                           ),
                           child: SizedBox(width: 510, height: 500,  child: DealDuJour(product:productProvider.dealsOfTheDay[index] )),

                         ),
                         // SizedBox(height: 20,),
                       ],
                     );
                   },
                   indicatorLayout: PageIndicatorLayout.COLOR,
                   autoplay: true,
                   duration: 1000,
                 ),
               ): const Center(child: Text('Aucun produit'));
             case ProductDealOfTheDayStatus.error:
               return const Center(child: Text('error'));
           }
          },
        ),
      ],
    );
  }
}

class DealOfOfTheDayWidgetShimmer extends StatelessWidget {
  const DealOfOfTheDayWidgetShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 510,
      child: Swiper(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                width: MediaQuery.of(context).size.width-20,
                // padding: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  border : Border.all(color: AppColors.SECONDARY, width: 2),
                ),
                child: SizedBox(width: 510, height: 500,  child: SizedBox(
                  width: MediaQuery.of(context).size.width*0.9,
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomShimmer(height : 510),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:  [
                            Padding(padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10, top: 10),
                              child: CustomShimmer(height : 15),),
                            Padding(padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                              child: CustomShimmer(height : 15),),
                            CustomShimmer(height : 30)
                          ],
                        ),
                      ],
                    ),
                  ),
                )),

              ),
              // SizedBox(height: 20,),
            ],
          );
        },
        indicatorLayout: PageIndicatorLayout.COLOR,
        autoplay: true,
        duration: 1000,
      ),
    );
  }
}

