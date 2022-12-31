import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/config/app_images.dart';
import 'package:wantermarket/data/models/body/product.dart';
import 'package:wantermarket/providers/wishlist_provider.dart';
import 'package:wantermarket/shared/contact_vendor.dart';

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
            itemCount: product.images!.isNotEmpty ? product.images!.length : 1,
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
                imageUrl: product.images!.isNotEmpty
                    ? product.images![index].path.replaceAll('\r\n', '')
                    : AppImage.logo,
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        Positioned(
            child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //button back
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: ClipOval(
                  child: Container(
                    color: Colors.grey[200],
                    height: 35,
                    width: 35,
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: AppColors.SECONDARY,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  //button share
                  InkWell(
                    onTap: () async {
                      ContactVendor.shareProduct(product);
                    },
                    child: ClipOval(
                      child: Container(
                        color: Colors.grey[200],
                        height: 35,
                        width: 35,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.share,
                          color: AppColors.SECONDARY,
                        ),
                      ),
                    ),
                  ),
                  //button favorite
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      !Provider.of<WishlistProvider>(context, listen: false)
                              .isInWishlist(product)
                          ? Provider.of<WishlistProvider>(context,
                                  listen: false)
                              .addToWishlist(product, context)
                          : Provider.of<WishlistProvider>(context,
                                  listen: false)
                              .removeFromWishlist(product, context);
                    },
                    child: ClipOval(
                      child: Container(
                        color: Colors.grey[200],
                        height: 35,
                        width: 35,
                        alignment: Alignment.center,
                        child: Consumer<WishlistProvider>(
                            builder: (context, wishProvider, _) {
                          return Icon(
                              !wishProvider.isInWishlist(product)
                                  ? Icons.favorite_border
                                  : Icons.favorite,
                              color: !wishProvider.isInWishlist(product)
                                  ? AppColors.SECONDARY
                                  : Colors.red);
                        }),
                      ),
                    ),
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
