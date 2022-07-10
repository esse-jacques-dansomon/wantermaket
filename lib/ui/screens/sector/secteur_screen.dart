import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/providers/category_provider.dart';
import 'package:wantermarket/shared/app_helper.dart';
import 'package:wantermarket/ui/basewidgets/app_bars/drawer.dart';
import 'package:wantermarket/ui/screens/sector/widgets/secteur_card.dart';

import '../../../config/app_colors.dart';
import '../../../route/routes.dart';
import '../../basewidgets/app_bars/app_bar.dart';
import '../../basewidgets/bottom_bar/bottom_nav_bar.dart';

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
          //prendre la taille de l'écran

          children:  [
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 5),
              child: Text(
                "Nos secteurs",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 5 , bottom: 10, right: 15),
              child: Text(
                'Retrouvez les boutiques par secteurs',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Consumer<CategoryProvider>(
                    builder: (context, categoryProvider, _) => GridView.builder(
                      itemCount: categoryProvider.categories.length,
                      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: AppHelper.getCrossAxisCount(context, width: 170),
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 8,
                        childAspectRatio: 1.30,
                      ),
                      itemBuilder: (context, index) {
                        return  SecteurCard(category : categoryProvider.categories[index]);
                      },
                    ),
                  ),
                )
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
