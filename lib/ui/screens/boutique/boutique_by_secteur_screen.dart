import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/providers/category_provider.dart';
import 'package:wantermarket/ui/screens/boutique/widgets/boutique_card.dart';
import 'package:wantermarket/ui/screens/boutique/widgets/boutique_card_one_per_row.dart';
import '../../../data/models/body/category.dart';
import '../../../route/routes.dart';
import '../../basewidgets/app_bars/app_bar_with_return.dart';
import '../../basewidgets/bottom_bar/bottom_nav_bar.dart';

class BoutiqueBySecteurScreen extends StatefulWidget {
  final Category category;
  const BoutiqueBySecteurScreen({Key? key, required this.category}) : super(key: key);

  @override
  State<BoutiqueBySecteurScreen> createState() => _BoutiqueBySecteurScreenState();
}

class _BoutiqueBySecteurScreenState extends State<BoutiqueBySecteurScreen> {
  bool two_items = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CategoryProvider>(context, listen: false).getBoutiquesBySector(widget.category.id!);
  }

  @override
  Widget build(BuildContext context) {
    //final cardSize = MediaQuery.of(context).size.width / 2 - 32;
    return Scaffold(
      appBar: appBarWithReturn(title:widget.category.name! , context: context),
      bottomNavigationBar: const CustomBottomNavBar(boutique: true,),
      floatingActionButton: FloatingActionButton(

        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addProduct);
        },
        backgroundColor: AppColors.PRIMARY,
        child: const Icon(Icons.add, color: AppColors.WHITE, size: 50,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children:  [
            const SizedBox(
              height: 8,
            ),
            //button change item style
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 15,
                ),
                InkWell(child: Icon(Icons.table_rows_outlined, color: AppColors.PRIMARY,), onTap: (){
                  if (!two_items) {
                    setState(() {
                      two_items = true;
                    });
                  }
                },),
                const SizedBox(
                  width: 8,
                ),
                InkWell(child: Icon(Icons.tab_sharp, color: AppColors.PRIMARY,), onTap: (){

                  if (two_items) {
                    setState(() {
                      two_items = false;
                    });
                  }

                },),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
        Expanded(
             child: Padding(
               padding: const EdgeInsets.only(left: 10, right: 10),
               child: Consumer<CategoryProvider>(
                 builder: (ctx, categoryProvider, child){
                   return GridView.builder(
                     itemCount: categoryProvider.boutiques.length,
                     gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                         crossAxisCount: two_items ? 2 : 1,
                         crossAxisSpacing: 12,
                         mainAxisSpacing: 8,
                         childAspectRatio: 1.30,
                         mainAxisExtent: two_items? 190 : 120
                     ),
                     itemBuilder: (context, index) {
                       return two_items?  BoutiqueCardBySecteur(boutique: categoryProvider.boutiques[index],) :  BoutiqueCardBySecteurOnePerRow(boutique: categoryProvider.boutiques[index]);
                     },
                   );
                 },
               ),
             )
               ),
            const SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }
}
