
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:wantermarket/config/app_images.dart';
import 'package:wantermarket/providers/vendor_provider.dart';
import 'package:wantermarket/providers/wishlist_provider.dart';
import 'package:wantermarket/route/routes.dart';
import 'package:wantermarket/shared/app_helper.dart';
import 'package:wantermarket/ui/basewidgets/cards/produit_by_boutique.dart';
import '../../../config/app_colors.dart';
import '../../../data/models/body/product.dart';
import '../../../providers/product_provider.dart';
import '../../basewidgets/bottom_bar/bottom_bar_vendor.dart';
import 'widgets/product_details_images.dart';
import 'widgets/proudct_details_information.dart';
import 'widgets/related_products.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  const ProductDetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  Future<void> _loadData() async {
    Provider.of<ProductProvider>(context, listen: false).getRelatedProducts(widget.product.idCategorie!);
    if(Provider.of<VendorProvider>(context, listen: false).boutique.id != widget.product.idBoutique) {
      Provider.of<VendorProvider>(context, listen: false).incrementProductView(widget.product.id!);
    }
  }

  @override
  initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: BottomBarVendor(product: widget.product),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //slider
              ProductDetailsImagesView(product: widget.product),

              //product information
              ProductDetailsInformation(product: widget.product),

              //related products
               const RelatedProducts(),

            ],
          ),
        ),
      ),
    );
  }
}





