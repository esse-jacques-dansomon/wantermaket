import 'package:flutter/material.dart';
import 'package:wantermarket/ui/basewidgets/app_bars/app_bar.dart';
import 'package:wantermarket/ui/basewidgets/app_bars/app_bar_with_return_type2.dart';
import 'package:wantermarket/ui/basewidgets/app_bars/drawer.dart';
import 'package:wantermarket/ui/basewidgets/boutique_card.dart';
import 'package:wantermarket/ui/basewidgets/produit_by_boutique_3.dart';
import 'package:wantermarket/ui/screens/boutique/boutique_by_secteur_screen.dart';
import 'package:wantermarket/ui/screens/boutique/widgets/boutique_card.dart';
import 'package:wantermarket/ui/screens/recherche/widget/product_found_fliter_widget.dart';

import '../../../config/app_colors.dart';
import '../../../data/models/body/product.dart';
import '../../../route/routes.dart';
import '../../../shared/app_helper.dart';
import '../../basewidgets/bottom_bar/bottom_nav_bar.dart';
import '../../basewidgets/produit_by_boutique_2.dart';
import '../../basewidgets/produit_card_without_vendor.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,
        child: SafeArea(
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.addProduct);
              },
              backgroundColor: AppColors.WHITE,
              child: const Icon(Icons.add, color: AppColors.PRIMARY, size: 50,),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            appBar: appBar(isActiveSearchbar: true),
            drawer: const AppDrawer(),
            bottomNavigationBar: const CustomBottomNavBar(search: true),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  TabBar(
                    labelColor: Colors.white,
                      unselectedLabelColor: AppColors.BLACK,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.PRIMARY,
                      ),

                      tabs:
                      const [
                       Tab(
                         text: 'Produits',
                       ),
                       Tab(
                         text: 'boutiques',
                       ),
                     ]
                  ),
                  const Expanded(child: TabBarView(
                      children: [
                        ProductsFound(),
                        BoutiquesFinded(),
                      ]

                  ))
                ],
              ),
            ),
          ),

    ));
  }
}

class ProductsFound extends StatelessWidget {
  const ProductsFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Trier par'.toUpperCase()),
                  SizedBox(
                    width: 10,
                  ),
                  DropdownButton(
                    hint: const Text('Prix'),
                    value: 'Prix',
                    items: const [
                      DropdownMenuItem(
                        child: Text('Prix'),
                        value: 'Prix',
                      ),
                      DropdownMenuItem(
                        child: Text('Nom'),
                        value: 'Nom',
                      ),
                      DropdownMenuItem(
                        child: Text('Popularité'),
                        value: 'Popularité',
                      ),
                    ], onChanged: (String? value) {  },
                  ),
                ],
              ),

              InkWell(
                onTap: (){
                  //on bottom sheet
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    isDismissible: false,
                    builder: (BuildContext context) {
                      return SizedBox(
                          child: const ProductFoundFilter());
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    children: const [
                      Text('Filter'),
                      SizedBox(width: 10,),
                      Icon(Icons.filter_alt_rounded, color: AppColors.PRIMARY,size: 28,)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        Expanded(child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 20,
          scrollDirection: Axis.vertical,
          itemBuilder : (context, index){
            return  ProductByBoutique3(product: Product());
          },
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: AppHelper.getCrossAxisCount(context, width: 230),
            childAspectRatio: 1,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
            mainAxisExtent: 315,
          ),
        ))

      ],
    );
  }
}

class BoutiquesFinded extends StatelessWidget {
  const BoutiquesFinded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Trier par'.toUpperCase()),
                  const SizedBox(
                    width: 10,
                  ),
                  DropdownButton(
                    hint: const Text('Prix'),
                    value: 'Prix',
                    items: const [
                      DropdownMenuItem(
                        child: Text('Prix'),
                        value: 'Prix',
                      ),
                      DropdownMenuItem(
                        child: Text('Nom'),
                        value: 'Nom',
                      ),
                      DropdownMenuItem(
                        child: Text('Popularité'),
                        value: 'Popularité',
                      ),
                    ], onChanged: (String? value) {  },
                  ),
                ],
              ),

              InkWell(
                onTap: (){},
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    children: [
                      Text('Filter'),
                      SizedBox(width: 10,),
                      Icon(Icons.filter_alt_rounded, color: AppColors.PRIMARY,size: 28,)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        Expanded(child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 20,
          scrollDirection: Axis.vertical,
          itemBuilder : (context, index){
            return  const BoutiqueCardBySecteur();
          },
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: AppHelper.getCrossAxisCount(context ),
            childAspectRatio: 1,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
            mainAxisExtent: 190,
          ),
        ))

      ],
    );
  }
}

