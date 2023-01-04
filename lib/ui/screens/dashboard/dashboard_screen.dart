import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/providers/auth_provider.dart';
import 'package:wantermarket/providers/vendor_provider.dart';
import 'package:wantermarket/shared/contact_vendor.dart';
import 'package:wantermarket/ui/basewidgets/drawer/drawer.dart';
import 'package:wantermarket/ui/basewidgets/loaders/custom_app_loader.dart';
import 'package:wantermarket/ui/screens/home/home_screen.dart';


import 'package:wantermarket/ui/basewidgets/app_bars/app_bar.dart';
import 'package:wantermarket/ui/basewidgets/bottom_bar/bottom_nav_bar.dart';
import 'widgets/vendor_products.dart';
import 'widgets/vendor_stats.dart';


class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final ScrollController _controller = ScrollController();

  _loadData()  {
    Provider.of<VendorProvider>(context, listen: false).getBoutique(context);
    Provider.of<VendorProvider>(context, listen: false).getVendorProducts(context);

  }

  void _scrollListener() {
    if (_controller.position.pixels == _controller.position.maxScrollExtent ) {
      Provider.of<VendorProvider>(context, listen: false).getVendorPaginateProducts();
    }
  }

  @override
  initState()  {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<VendorProvider>(context, listen: false).getVendorStat(context);
      _controller.addListener(_scrollListener);
      if( Provider.of<VendorProvider>(context, listen: false).boutique.vendor?.firstName == null) {
        _loadData();
        Provider.of<AuthProvider>(context, listen: false).updateToken().whenComplete(() => {
        // ContactVendor.showCanAddProductDialog(context)
        });
    }

    });


  }

  @override
  Widget build(BuildContext context) {

    return RefreshIndicator(
      onRefresh: () async {
        _loadData();
        Provider.of<VendorProvider>(context, listen: false).getVendorStat(context);
      },
      child: Scaffold(
        bottomNavigationBar:  CustomBottomNavBar(profile: true, scrollController: _controller,),
        appBar: appBar(isActiveSearchbar: true),
        drawer: const AppDrawer(),
        backgroundColor: AppColors.WHITE,
        body:  Provider.of<VendorProvider>(context, listen: true).isProductsLoad? SafeArea(
          child: SingleChildScrollView(
            controller: _controller,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10) ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children:  [

                VendorDashboardStats(),

                VendorDashboardProducts(),

                Consumer<VendorProvider>(builder:(context, paginate, child){
                  switch(paginate.profileProductsPaginateState){
                    case ProfilePaginationState.loaded:
                      return Container();
                    case ProfilePaginationState.loading:
                      return const Center(child: CustomAppLoader());
                    case ProfilePaginationState.error:
                      return const Center(child: Text('Erreur de chargement'),);
                      case ProfilePaginationState.noMoreData:
                      return Container(height: 100, child: const Center(child: Text('Aucun produit à afficher'),));
                  }
                } ),

                SizedBox(height: 50,),
              ],
            ),

          ),
        ) : const LoaderWidget(),
      ),
    );
  }
}




