import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/providers/product_provider.dart';
import 'package:wantermarket/route/routes.dart';
import 'package:wantermarket/ui/basewidgets/cards/produit_by_boutique.dart';
import 'package:wantermarket/ui/screens/home/widgets/title_and_more_widget.dart';


import '../../../../data/models/body/filter_model.dart';
import '../../../basewidgets/shimmer/shimmer_product.dart';


class TopAnnoncesWidget extends StatelessWidget {
  const TopAnnoncesWidget({
    Key? key,
  }) : super(key: key );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndMoreText( title: 'Top Annonces', moreText: 'Voir Plus', route:  AppRoutes.search, filterModel: FilterModel(keyWorld: null,isPopular: 1)),
        Consumer<ProductProvider>(
            builder: (context, productProvider, child) {
              switch (productProvider.topAnnoncesStatus) {
                case ProductTopAnnoncesStatus.initial:
                  return const Center(child: Text('initial'));
                case ProductTopAnnoncesStatus.loading:
                  return TopAnnoncesShimmer();
                case ProductTopAnnoncesStatus.loaded:
                  return productProvider.topAnnonces.length > 0 ? Container(
                    height: 315,
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: ListView.separated(
                      itemCount: productProvider.topAnnonces.length,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 10),
                      itemBuilder: (BuildContext context, int index) => SizedBox(width:200, child: ProductByBoutique(product: productProvider.topAnnonces[index],)),
                    ),
                  ) : const Center(child: Text('Aucun produit'));
                case ProductTopAnnoncesStatus.error:
                  return const Center(child: Text('error'));
              }
            },
          ),
      ],
    );
  }
}

class TopAnnoncesShimmer extends StatelessWidget {
  const TopAnnoncesShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 315,
      child: ListView.separated(
          itemCount: 15,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 10),
          itemBuilder: (BuildContext context, int index) => ProductShimmer()),
    );
  }
}
