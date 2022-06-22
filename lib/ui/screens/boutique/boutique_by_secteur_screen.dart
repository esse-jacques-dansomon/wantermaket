import 'package:flutter/material.dart';
import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/ui/screens/boutique/widgets/boutique_card.dart';
import 'package:wantermarket/ui/screens/boutique/widgets/boutique_card_one_per_row.dart';
import '../../basewidgets/app_bars/app_bar_with_return.dart';
import '../../basewidgets/bottom_bar/bottom_nav_bar.dart';

class BoutiqueBySecteurScreen extends StatefulWidget {
  const BoutiqueBySecteurScreen({Key? key}) : super(key: key);

  @override
  State<BoutiqueBySecteurScreen> createState() => _BoutiqueBySecteurScreenState();
}

class _BoutiqueBySecteurScreenState extends State<BoutiqueBySecteurScreen> {
  bool two_items = true;

  @override
  Widget build(BuildContext context) {
    //final cardSize = MediaQuery.of(context).size.width / 2 - 32;
    return SafeArea(
      child: Scaffold(
        appBar: appBarWithReturn(title: 'Secteur Agro', context: context),
        bottomNavigationBar: const CustomBottomNavBar(boutique: true,),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children:  [
              Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 5),
              child: Text(
                "Nos secteurs ${two_items ? two_items.toString() :two_items.toString()}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, top: 0, bottom: 10),
              child: Text(
                ' Retrouvez ici toutes les boutiques du secteur Electronique ',
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
            //button change item style
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
               child: GridView.builder(
                           itemCount: 40,
                           gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: two_items ? 2 : 1,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 8,
                              childAspectRatio: 1.30,
                              mainAxisExtent: two_items? 190 : 120
                           ),
                           itemBuilder: (context, index) {
                             return two_items? const BoutiqueCardBySecteur() : const BoutiqueCardBySecteurOnePerRow();
                           },
                         ),
             )
               ),
          ],
        ),
      ),
    );
  }
}
