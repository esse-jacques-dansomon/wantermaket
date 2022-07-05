import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/providers/product_provider.dart';
import 'package:wantermarket/ui/screens/home/widgets/title_and_more_widget.dart';

import '../../../../config/app_colors.dart';
import '../../../basewidgets/deal_du_jour_card.dart';
import '../../sector/secteur_screen.dart';

class DealDuJourWidget extends StatelessWidget {
  const DealDuJourWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleAndMoreText( title: 'En Promotion', moreText: 'Voir Plus', widget: SecteurScreen()),
        SizedBox(
          height: 510,
          child: Consumer<ProductProvider>(
            builder: (context, productProvider, child){
             return Swiper(
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
                        child: SizedBox(height: 500, child: DealDuJour(product:productProvider.dealsOfTheDay[index] )),

                      ),
                      // SizedBox(height: 20,),
                    ],
                  );
                },
                indicatorLayout: PageIndicatorLayout.COLOR,
                autoplay: true,
                duration: 1000,
              );
            },
          ),
        ),
      ],
    );
  }
}
