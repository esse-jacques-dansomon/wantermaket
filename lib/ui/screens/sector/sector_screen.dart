import 'package:flutter/material.dart';
import 'package:wantermarket/ui/basewidgets/drawer/drawer.dart';

import '../../../config/app_colors.dart';
import '../../../route/routes.dart';
import '../../basewidgets/app_bars/app_bar.dart';
import '../../basewidgets/bottom_bar/bottom_nav_bar.dart';
import 'widgets/sector_items.dart';
import 'widgets/sector_title.dart';

class SecteurScreen extends StatelessWidget {
  const SecteurScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(isActiveSearchbar: true),
      drawer: const AppDrawer(),
      floatingActionButton: FloatingActionButton(

        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addProduct);
        },
        backgroundColor: AppColors.PRIMARY,
        child: const Icon(Icons.add, color: AppColors.WHITE, size: 50,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomNavBar(boutique: true,),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children:  const [
            SectorTitle(),
            SectorItems(),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}


