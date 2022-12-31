import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wantermarket/ui/basewidgets/shimmer/custom_products_loader.dart';

import '../../../../config/app_colors.dart';
import '../../../../data/models/body/filter_model.dart';
import '../../../../providers/auth_provider.dart';
import '../../../../providers/search_provider.dart';
import '../../../../shared/app_helper.dart';
import '../../../basewidgets/cards/produit_by_boutique.dart';
import '../../../basewidgets/loaders/custom_app_loader.dart';

class ProductsFound extends StatefulWidget {
  const ProductsFound({Key? key}) : super(key: key);

  @override
  State<ProductsFound> createState() => _ProductsFoundState();
}

class _ProductsFoundState extends State<ProductsFound> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      SharedPreferences prefs =
          Provider.of<AuthProvider>(context, listen: false)
              .authRepo
              .sharedPreferences;
      String? filter = prefs.getString("wanter_filter");
      FilterModel filterModel = FilterModel.fromMap(json.decode(filter!));
      Provider.of<SearchProvider>(context, listen: false)
          .filter(context, isNewSearch: false, filterModel: filterModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child:
            Consumer<SearchProvider>(builder: (context, searchProvider, child) {
          switch (searchProvider.state) {
            case SearchProductState.loading:
              return const CustomProductsLoader(count: 10, isGrid: true);
            case SearchProductState.loaded:
              return Container(
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        //padding: const EdgeInsets.symmetric(horizontal: 15),
                        physics: const BouncingScrollPhysics(),
                        itemCount: searchProvider.products.length,
                        scrollDirection: Axis.vertical,
                        controller: _controller,
                        itemBuilder: (context, index) {
                          return ProductByBoutique(
                              product: searchProvider.products[index]);
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              AppHelper.getCrossAxisCount(context, width: 230),
                          childAspectRatio: 1,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 315,
                        ),
                      ),
                    ),
                    if (searchProvider.paginationState ==
                        searchPaginationState.loading)
                      Container(
                          height: 100,
                          child: Center(child: const CustomAppLoader())),
                  ],
                ),
              );
            case SearchProductState.initial:
            case SearchProductState.noProducts:
              return const Center(
                child: Text(
                  'Aucun produit trouvé',
                  style: TextStyle(color: AppColors.BLACK),
                ),
              );
            case SearchProductState.error:
              return const Center(
                child: Text(
                  'une erreur s\' est produite',
                  style: TextStyle(color: AppColors.BLACK),
                ),
              );
          }
        }))
      ],
    );
  }
}
