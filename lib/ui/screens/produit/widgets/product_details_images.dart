import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/config/app_images.dart';
import 'package:wantermarket/data/models/body/product.dart';
import 'package:wantermarket/providers/wishlist_provider.dart';

class ProductDetailsImagesView extends StatelessWidget {
  const ProductDetailsImagesView({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 430,
          width: double.infinity,
          child: Swiper(
            indicatorLayout: PageIndicatorLayout.COLOR,
            itemCount: product.images!.isNotEmpty ?  product.images!.length : 1,
            pagination: const SwiperPagination(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(bottom: 15),
              builder: DotSwiperPaginationBuilder(
                color: Colors.grey,
                activeColor: Colors.white,
                size: 10,
                activeSize: 12,
              ),
            ),
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                imageUrl:product.images!.isNotEmpty ?  product.images![index].path.replaceAll('\r\n', '') : AppImage.logo,
                fit: BoxFit.cover,
              );
            },

          ),
        ),
        Positioned(child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //button back
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_rounded, color: AppColors.SECONDARY,),
                onPressed: () => Navigator.pop(context),
              ),
              Column(
                children: [
                  //button share
                  IconButton(
                    icon: const Icon(Icons.share, color: AppColors.SECONDARY,),
                    onPressed: () async{
                      Share.share('${product.name} à ${product.priceBefore ?? product.price} F CFA chez ${product.boutique!.name!} sur Wanter Market. Visitez en cliquant sur ce lien : https://wantermarket.sn/produit${Uri.encodeFull('&prid=${product.id}')}');
                    },
                  ),
                  //button favorite
                  IconButton(
                    icon: Consumer<WishlistProvider>(
                        builder: (context, wishProvider, _){
                          return Icon( !wishProvider.isInWishlist(product) ? Icons.favorite_border : Icons.favorite, color: !wishProvider.isInWishlist(product) ?AppColors.SECONDARY : Colors.red);
                        }
                    ),
                    onPressed: (){
                      !Provider.of<WishlistProvider>(context, listen: false).isInWishlist(product) ?
                      Provider.of<WishlistProvider>(context, listen: false).addToWishlist(product, context) :
                      Provider.of<WishlistProvider>(context, listen: false).removeFromWishlist(product, context);
                    },
                  ),
                ],
              )
            ],
          ),
        ))
      ],
    );
  }
}
