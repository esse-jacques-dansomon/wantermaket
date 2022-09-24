
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wantermarket/providers/vendor_provider.dart';
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
    Provider.of<ProductProvider>(context, listen: false).getRelatedProducts(context, widget.product.idCategorie!, widget.product.id!);
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





