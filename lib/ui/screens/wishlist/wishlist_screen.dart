import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/providers/wishlist_provider.dart';
import 'package:wantermarket/ui/basewidgets/app_bars/app_bar_with_return.dart';
import 'package:wantermarket/ui/basewidgets/cards/produit_by_boutique.dart';

import '../../../shared/app_helper.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: appBarWithReturn(title: 'Ma Liste d\'envies', context: context),
      body: SafeArea(
        child: Provider.of<WishlistProvider>(context, listen: true).wishlist.isNotEmpty ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding : const EdgeInsets.only(left: 12.0, right: 12.0, top: 10),
                child: Consumer<WishlistProvider>(
                  builder: (context, wishlistProvider, _){
                    return GridView.builder(
                        itemCount: wishlistProvider.wishlist.length,
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
                          return ProductByBoutique(product: wishlistProvider.wishlist[index], isWishlist: true,);
                        }
                    );
                  }
                ),
              ),
            ),


          ],
        ) : const Center(
          child: Text('Votre liste d\'envies est vide', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
