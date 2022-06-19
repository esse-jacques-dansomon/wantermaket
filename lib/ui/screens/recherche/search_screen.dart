import 'package:flutter/material.dart';

import '../../../config/app_colors.dart';
import '../../basewidgets/bottom_bar/bottom_nav_bar.dart';
import '../../basewidgets/produit_by_boutique_2.dart';
import '../../basewidgets/produit_card_without_vendor.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const CustomBottomNavBar(search: true,),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10),
                height: 60,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 70,
                        width: 50,
                        child : Row(
                          children: [
                            Container(
                              child: DropdownButton(
                                hint: const Text('SN'),
                                value: 'SN',
                                items: const [
                                  DropdownMenuItem(
                                    child: Text('SN'),
                                    value: 'SN',
                                  ),
                                  DropdownMenuItem(
                                    child: Text('TG'),
                                    value: 'TG',
                                  ),
                                  DropdownMenuItem(
                                    child: Text('BN'),
                                    value: 'BN',
                                  ),
                                ], onChanged: (String? value) {  },
                              ),
                            )
                          ],
                        )
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    //search input
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(

                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Rechercher',
                        ),
                      ),
                    ),
                    //filter icon

                  ],
                ),
              ),
              //sort
              Container(
                padding: const EdgeInsets.only(top: 10),
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
                      onTap: (){},
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Row(
                          children: [
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
              //expanded
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Produits Trouvés',style: TextStyle(color: Colors.black, fontSize: 18),)


                  ],
                ),
              ),
              Expanded(child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 20,
                scrollDirection: Axis.vertical,
                itemBuilder : (context, index){
                  return  ProductByBoutique2(id: index);
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 315,
                ),
              ))

            ],
          ),
        ),

      ),
    );
  }
}
