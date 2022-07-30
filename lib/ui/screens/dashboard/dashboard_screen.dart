import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/providers/auth_provider.dart';
import 'package:wantermarket/providers/vendor_provider.dart';
import 'package:wantermarket/route/routes.dart';
import 'package:wantermarket/shared/contact_vendor.dart';
import 'package:wantermarket/ui/basewidgets/drawer/drawer.dart';
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

  _loadData()  {
    Provider.of<VendorProvider>(context, listen: false).getBoutique();
    Provider.of<VendorProvider>(context, listen: false).getVendorProducts();

  }



  @override
  initState()  {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<VendorProvider>(context, listen: false).getVendorStat();
      if( Provider.of<VendorProvider>(context, listen: false).boutique.vendor?.firstName == null) {
        _loadData();
        Provider.of<AuthProvider>(context, listen: false).updateToken();
    }
      ContactVendor.showCanAddProductDialog(context);

    });





  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBar(profile: true,),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addProduct);
        },
        backgroundColor: AppColors.PRIMARY,
        child: const Icon(Icons.add, color: AppColors.WHITE, size: 50,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: appBar(isActiveSearchbar: true),
      drawer: const AppDrawer(),
      backgroundColor: AppColors.WHITE,
      body:  Provider.of<VendorProvider>(context, listen: true).isProductsLoad? SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10) ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [

              VendorDashboardStats(),

              VendorDashboardProducts(),

              SizedBox(height: 50,),
            ],
          ),

        ),
      ) : const LoaderWidget(),
    );
  }
}




