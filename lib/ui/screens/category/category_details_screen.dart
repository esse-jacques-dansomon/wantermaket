import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/providers/category_detail_provider.dart';
import 'package:wantermarket/ui/basewidgets/cards/produit_by_boutique.dart';
import 'package:wantermarket/ui/basewidgets/shimmer/custom_products_loader.dart';

import '../../../config/app_colors.dart';
import '../../../data/models/body/category.dart';
import '../../basewidgets/loaders/custom_app_loader.dart';

class CategoryScreen extends StatefulWidget {
  final Category category;
  const CategoryScreen({Key? key, required this.category}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final ScrollController _controller = ScrollController();

  Future<void> _loadData() async {
    Provider.of<CategoryProviderDetails>(context, listen: false)
        .getCategoryProducts(context, widget.category.id!);
    Provider.of<CategoryProviderDetails>(context, listen: false)
        .getSubCategoriesOfCategory(context, widget.category.id!);
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
    super.initState();
    _controller.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      if (Provider.of<CategoryProviderDetails>(context, listen: false)
              .selectedSubCategory ==
          0) {
        Provider.of<CategoryProviderDetails>(context, listen: false)
            .getCategoryProducts(context, widget.category.id!, isPagination: true);
      } else {
        Provider.of<CategoryProviderDetails>(context, listen: false)
            .getSubCategoryProducts(context,
                Provider.of<CategoryProviderDetails>(context, listen: false)
                    .selectedSubCategory,
                isPagination: true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          widget.category.name!,
          style:  TextStyle(color:  AppColors.PRIMARY ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.PRIMARY,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded, color: AppColors.PRIMARY),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 32,
              padding: const EdgeInsets.only(left: 15, top: 5),
              child: Consumer<CategoryProviderDetails>(
                builder: (ctx, cp, child) {
                  return ListView.builder(
                    itemCount: cp.souscategories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () async {
                          await Provider.of<CategoryProviderDetails>(context,
                                  listen: false)
                              .getSubCategoryProducts( context,
                                  cp.souscategories[index].id!);
                        },
                        child: Container(
                          padding: const EdgeInsets.only(right: 12, left: 12),
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Provider.of<CategoryProviderDetails>(context,
                                            listen: false)
                                        .selectedSubCategory ==
                                    cp.souscategories[index].id
                                ? AppColors.PRIMARY
                                : Colors.black,
                          ),
                          child: Center(
                              child: Text(
                            cp.souscategories[index].name!,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          )),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                ],
              ),
            ),
            Consumer<CategoryProviderDetails>(
              builder: (context, categoryDetailsProvider, child) {
                switch (categoryDetailsProvider.dataState) {
                  case DataState.initial:
                  case DataState.loading:
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const CustomProductsLoader(count: 10, isGrid: true,isScrollable: true),
                      ),
                    );
                  case DataState.loaded:
                  case DataState.loadingPagination:
                    return Expanded(
                      child: Column(
                        children: [
                          Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: Consumer<CategoryProviderDetails>(
                                      builder: (ctx, cp, child) {
                                    return GridView.builder(
                                        controller: _controller,
                                        itemCount: cp.products.length,
                                        physics: const BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisSpacing: 15,
                                          crossAxisSpacing: 7,
                                          childAspectRatio: 0.8,
                                          mainAxisExtent: 315,
                                          crossAxisCount: MediaQuery.of(context)
                                                      .size
                                                      .width >
                                                  230 * 4
                                              ? 4
                                              : (MediaQuery.of(context)
                                                          .size
                                                          .width >
                                                      230 * 3
                                                  ? 3
                                                  : 2),
                                        ),
                                        itemBuilder: (context, index) {
                                          return ProductByBoutique(
                                            product: cp.products[index],
                                          );
                                        });
                                  }))),
                          categoryDetailsProvider.dataState ==
                                  DataState.loadingPagination
                              ? const Center(child: CustomAppLoader())
                              : Container(),
                        ],
                      ),
                    );
                  case DataState.noMoreData:
                    return const Expanded(
                        child: Center(child: Text('pas de produits')));
                  case DataState.error:
                    return const Center(child: Text('Erreur de chargement'));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
