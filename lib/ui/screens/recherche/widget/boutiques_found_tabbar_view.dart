import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/app_colors.dart';
import '../../../../providers/search_provider.dart';
import '../../../../shared/app_helper.dart';
import '../../../basewidgets/cards/boutique_by_sector_card.dart';

class BoutiquesFounded extends StatelessWidget {
  const BoutiquesFounded({Key? key}) : super(key: key);

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
                  const SizedBox(
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
                onTap: (){},
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
            return searchProvider.boutiques.isNotEmpty ? GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: searchProvider.boutiques.length,
              scrollDirection: Axis.vertical,
              itemBuilder : (context, index){
                return  BoutiqueCardBySecteur(boutique: searchProvider.boutiques[index]);
              },
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: AppHelper.getCrossAxisCount(context ),
                childAspectRatio: 1,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
                mainAxisExtent: 190,
              ),
            ) : const Center(child: Text('Aucune boutique trouvé', style: TextStyle(color: AppColors.BLACK),),);
          },
        ))

      ],
    );
  }
}
