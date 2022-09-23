import 'package:flutter/material.dart';
import 'package:wantermarket/ui/basewidgets/app_bars/app_bar.dart';
import 'package:wantermarket/ui/basewidgets/drawer/drawer.dart';
import 'package:wantermarket/ui/screens/recherche/widget/boutiques_found_tabbar_view.dart';
import 'package:wantermarket/ui/screens/recherche/widget/product_found_fliter_widget.dart';
import 'package:wantermarket/ui/screens/recherche/widget/products_found_tabbar_view.dart';

import '../../../config/app_colors.dart';
import '../../../route/routes.dart';
import '../../basewidgets/bottom_bar/bottom_nav_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor : AppColors.WHITE,
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

          bottomNavigationBar:  CustomBottomNavBar(search: true),
          body: SafeArea(

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                       Expanded(
                        child: TabBar(
                          //padding: const EdgeInsets.symmetric(horizontal: 15),
                          labelColor: Colors.white,
                            unselectedLabelColor: AppColors.BLACK,
                        unselectedLabelStyle : const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                            labelStyle :const TextStyle(fontSize: 18.5, fontWeight: FontWeight.w500),
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            color: AppColors.PRIMARY,
                          ),
                          indicatorColor: AppColors.PRIMARY,

                            tabs:
                            const [
                             Tab(
                               text: 'Produits',
                             ),
                             Tab(
                               text: 'Boutiques',
                             ),
                           ]
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          showModalBottomSheet(
                            context: context,
                            isDismissible: false,
                            isScrollControlled: true,
                            builder: (BuildContext context) {

                              return  SizedBox(
                                  height: MediaQuery.of(context).size.height*0.9,
                                  child: const ProductFoundFilter());
                            },
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric( vertical: 10, horizontal: 10),
                          child: Row(
                            children: const [
                              Icon(Icons.filter_alt_rounded, color: AppColors.PRIMARY,size: 28,)
                            ],
                          ),),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
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