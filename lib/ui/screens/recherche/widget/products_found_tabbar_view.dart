import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/app_colors.dart';
import '../../../../providers/search_provider.dart';
import '../../../../shared/app_helper.dart';
import '../../../basewidgets/cards/produit_by_boutique.dart';

class ProductsFound extends StatelessWidget {
  const ProductsFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Consumer<SearchProvider>(
            builder: (context, searchProvider, child){
              switch(searchProvider.state){
                case SearchProductState.loading:
                  return const Center(child: CircularProgressIndicator());
                case SearchProductState.loaded:
                  return GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: searchProvider.products.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder : (context, index){
                      return ProductByBoutique(product: searchProvider.products[index]);
                    },
                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: AppHelper.getCrossAxisCount(context, width: 230),
                      childAspectRatio: 1,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 315,
                    ),
                  );
                case SearchProductState.initial:
                case SearchProductState.noProducts:
                  return const Center(child: Text('Aucun produit trouvé', style: TextStyle(color: AppColors.BLACK),),);
                case SearchProductState.error:
                  return const Center(child: Text('une erreur s\' est produite', style: TextStyle(color: AppColors.BLACK),),);
              }
            }
        ))

      ],
    );
  }
}