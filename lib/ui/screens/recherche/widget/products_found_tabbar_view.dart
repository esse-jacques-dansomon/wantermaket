import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/ui/screens/recherche/widget/product_found_fliter_widget.dart';

import '../../../../config/app_colors.dart';
import '../../../../providers/search_provider.dart';
import '../../../../shared/app_helper.dart';
import '../../../basewidgets/cards/produit_by_boutique.dart';

class ProductsFound extends StatelessWidget {
  const ProductsFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Trier par'.toUpperCase()),
                  SizedBox(
                    width: 10,
                  ),
                  DropdownButton(
                    hint: const Text('Prix'),
                    value: 'Prix',
                    items: const [
                      DropdownMenuItem(
                        child: Text('Prix'),
                        value: 'Prix',
                      ),
                      DropdownMenuItem(
                        child: Text('Nom'),
                        value: 'Nom',
                      ),
                      DropdownMenuItem(
                        child: Text('Popularité'),
                        value: 'Popularité',
                      ),
                    ], onChanged: (String? value) {  },
                  ),
                ],
              ),

              InkWell(
                onTap: (){
                  //on bottom sheet
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    isDismissible: false,
                    builder: (BuildContext context) {
                      return  SizedBox(
                          height: MediaQuery.of(context).size.height * 0.95,
                          child: const ProductFoundFilter());
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    children: const [
                      Text('Filter'),
                      SizedBox(width: 10,),
                      Icon(Icons.filter_alt_rounded, color: AppColors.PRIMARY,size: 28,)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        Expanded(child: Consumer<SearchProvider>(
            builder: (context, searchProvider, child){
              return searchProvider.products.isNotEmpty ? GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: searchProvider.products.length,
                scrollDirection: Axis.vertical,
                itemBuilder : (context, index){
                  return ProductByBoutique(product: searchProvider.products[index]);
                },
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: AppHelper.getCrossAxisCount(context, width: 230),
                  childAspectRatio: 1,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 315,
                ),
              ) : const Center(child: Text('Aucun produit trouvé', style: TextStyle(color: AppColors.BLACK),),);
            }
        ))

      ],
    );
  }
}