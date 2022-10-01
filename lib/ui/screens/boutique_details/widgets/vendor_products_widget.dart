import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/shared/app_helper.dart';
import 'package:wantermarket/ui/basewidgets/cards/produit_by_boutique.dart';
import 'package:wantermarket/ui/basewidgets/shimmer/custom_products_loader.dart';

import '../../../../providers/boutique_provider.dart';

class VendorProductsWidget extends StatelessWidget {
  const VendorProductsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //search input  + button
        Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey[200],
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    Provider.of<BoutiqueProvider>(context, listen: false)
                        .searchProduct(value);
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Rechercher',
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              const Icon(
                Icons.search,
                size: 25,
                color: Colors.black,
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          'Produits',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Consumer<BoutiqueProvider>(builder: (context, boutiqueProvider, child) {
          switch (boutiqueProvider.boutiqueProduitsState) {
            case BoutiqueProduitsState.initial:
            case BoutiqueProduitsState.loading:
              return const CustomProductsLoader(count: 10, isGrid: true);
            case BoutiqueProduitsState.loaded:
              return boutiqueProvider.productsSearch.length > 0
                  ? Column(
                    children: [
                      GridView.builder(
                          itemCount: boutiqueProvider.productsSearch.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  AppHelper.getCrossAxisCount(context, width: 230),
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 5,
                              mainAxisExtent: 320,
                              childAspectRatio: 1.5),
                          itemBuilder: (context, index) {
                            return SizedBox(
                                width: 230,
                                child: ProductByBoutique(
                                  product: boutiqueProvider.productsSearch[index],
                                ));
                          }),
                      //LOADER FOR PAGINATE
                      boutiqueProvider.paginationState ==
                              PaginationState.loading
                          ? const CustomProductsLoader(count: 10, isGrid: true)
                          : const SizedBox(),
                    ],
                  )
                  : const Center(
                      child: Text('Aucun produit trouvé'),
                    );
            case BoutiqueProduitsState.error:
              return const Center(
                child: Text('Erreur de chargement'),
              );
          }
        }),
        // Consumer<BoutiqueProvider>(builder: (context, boutiqueProvider, child) {
        //   return GridView.builder(
        //       itemCount: boutiqueProvider.productsSearch.length,
        //       physics: const NeverScrollableScrollPhysics(),
        //       shrinkWrap: true,
        //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //           crossAxisCount:
        //               AppHelper.getCrossAxisCount(context, width: 230),
        //           mainAxisSpacing: 10,
        //           crossAxisSpacing: 5,
        //           mainAxisExtent: 320,
        //           childAspectRatio: 1.5),
        //       itemBuilder: (context, index) {
        //         return SizedBox(
        //             width: 230,
        //             child: ProductByBoutique(
        //               product: boutiqueProvider.productsSearch[index],
        //             ));
        //       });
        // }),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
