import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/ui/basewidgets/shimmer/custom_shop_loader.dart';

import '../../../../config/app_colors.dart';
import '../../../../providers/search_provider.dart';
import '../../../../shared/app_helper.dart';
import '../../../basewidgets/cards/boutique_by_sector_card.dart';

class BoutiquesFounded extends StatelessWidget {

  const BoutiquesFounded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Expanded(child: Consumer<SearchProvider>(
          builder: (context, searchProvider, child){
            switch(searchProvider.searchBoutiqueState){
              case SearchBoutiqueState.loading:
                return CustomShopLoader(count: 15, isGrid: true);
              case SearchBoutiqueState.loaded:
                return  GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: searchProvider.boutiques.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder : (context, index){

                    return  BoutiqueCardBySecteur(boutique: searchProvider.boutiques[index]);
                  },
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: AppHelper.getCrossAxisCount(context ),
                    childAspectRatio: 1,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 190,
                  ),
                ) ;
              case SearchBoutiqueState.initial:
              case SearchBoutiqueState.noProducts:
                return const Center(child: Text('Aucun produit trouvé', style: TextStyle(color: AppColors.BLACK),),);
              case SearchBoutiqueState.error:
                return const Center(child: Text('une erreur s\' est produite', style: TextStyle(color: AppColors.BLACK),),);
            }
          },
        ))

      ],
    );
  }
}
