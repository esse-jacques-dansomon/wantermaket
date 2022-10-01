import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wantermarket/data/models/body/boutique.dart';
import 'package:wantermarket/providers/auth_provider.dart';
import 'package:wantermarket/ui/screens/boutique_details/widgets/vendor_informations_widget.dart';
import 'package:wantermarket/ui/screens/boutique_details/widgets/vendor_products_widget.dart';

import '../../../providers/boutique_provider.dart';
import '../../basewidgets/app_bars/app_bar_with_return.dart';

class BoutiqueDetailsScreen extends StatefulWidget {
  final Boutique boutique;
  const BoutiqueDetailsScreen({Key? key, required  this.boutique}) : super(key: key);

  @override
  State<BoutiqueDetailsScreen> createState() => _BoutiqueDetailsScreenState();
}

class _BoutiqueDetailsScreenState extends State<BoutiqueDetailsScreen> {
  final ScrollController _controller = ScrollController();

  void _scrollListener() {
    if (_controller.position.pixels == _controller.position.maxScrollExtent ) {
      Provider.of<BoutiqueProvider>(context, listen: false).getBoutiqueProduits(context, widget.boutique.id!, reload: false);
    }
  }

  _loadData() {
    Provider.of<BoutiqueProvider>(context, listen: false).getBoutiqueProduits(context, widget.boutique.id!);
    //not the connected user views
    if(widget.boutique.id != Provider.of<AuthProvider>(context, listen: false).user.boutiqueId){
      Provider.of<BoutiqueProvider>(context, listen: false).upgradeViewBoutique(context,widget.boutique.id!);
    }

  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_scrollListener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:appBarWithReturn(title: widget.boutique.name!, context: context),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _controller,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //seller informations
                VendorInformationWidget(boutique: widget.boutique,),
                //seller products
                const VendorProductsWidget()
                //loader for paginate

              ],
            ),
          ),
        ),
      ),
    );
  }
}


