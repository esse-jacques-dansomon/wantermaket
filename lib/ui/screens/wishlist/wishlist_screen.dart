import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/providers/product_provider.dart';
import 'package:wantermarket/ui/basewidgets/app_bars/app_bar_with_return.dart';
import 'package:wantermarket/ui/basewidgets/produit_by_boutique_3.dart';

import '../../../config/app_colors.dart';
import '../../../shared/app_helper.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final ScrollController _scrollController = ScrollController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        
      }
    });

  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Scaffold(
      appBar: appBarWithReturn(title: 'Ma Liste d\'envies', context: context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding : const EdgeInsets.only(left: 12.0, right: 12.0, top: 10),
              child: Consumer<ProductProvider>(
                builder: (context, productProvider, child){
                  return GridView.builder(
                    controller: _scrollController,
                      itemCount: productProvider.newArrivals.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: AppHelper.getCrossAxisCount(context, width: 170),
                          childAspectRatio: 1,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 315
                      ),
                      itemBuilder: (context, index){
                        return ProductByBoutique3(product: productProvider.newArrivals[index],);
                      }
                  );
                }
              ),
            ),
          ),


        ],
      ),
    ));
  }
}
