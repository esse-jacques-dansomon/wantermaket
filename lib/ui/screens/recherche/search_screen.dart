import 'package:flutter/material.dart';
import 'package:wantermarket/ui/basewidgets/app_bars/app_bar.dart';
import 'package:wantermarket/ui/basewidgets/drawer/drawer.dart';
import 'package:wantermarket/ui/screens/recherche/widget/boutiques_found_tabbar_view.dart';
import 'package:wantermarket/ui/screens/recherche/widget/products_found_tabbar_view.dart';

import '../../../config/app_colors.dart';
import '../../../route/routes.dart';
import '../../basewidgets/bottom_bar/bottom_nav_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.addProduct);
            },
            backgroundColor: AppColors.PRIMARY,
            child: const Icon(Icons.add, color: AppColors.WHITE, size: 50,),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          appBar: appBar(isActiveSearchbar: true, isOnSearchPage: true),
          drawer: const AppDrawer(),
          bottomNavigationBar: const CustomBottomNavBar(search: true),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  TabBar(
                    labelColor: Colors.white,
                      unselectedLabelColor: AppColors.BLACK,
                  unselectedLabelStyle : const TextStyle(fontSize: 17),
                      labelStyle :const TextStyle(fontSize: 18),
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
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
                        BoutiquesFounded(),
                      ]

                  ))
                ],
              ),
            ),
          ),
        ));
  }
}