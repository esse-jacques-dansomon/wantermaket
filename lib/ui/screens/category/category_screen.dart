import 'package:flutter/material.dart';
import 'package:wantermarket/ui/basewidgets/produit_card_without_vendor.dart';
import 'package:wantermarket/ui/screens/category/widget/filters_widget.dart';
import 'package:wantermarket/ui/screens/category/widget/short_item_widget.dart';

import '../../../config/app_colors.dart';
import '../../basewidgets/listTitle_item.dart';
import '../../basewidgets/produit_by_boutique_2.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Category', style: TextStyle(color: Colors.black),),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.PRIMARY,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded, color: AppColors.PRIMARY),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 32,
            padding: const EdgeInsets.only(left: 15, top: 5),
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.black,
                  ),
                  child: const Center(child: Text('T-shirts', style: const TextStyle(color: Colors.white, fontSize: 16),)),
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only( top: 10),
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context, builder: (context){
                      return FilterWidget();
                    });
                  },
                  child: Row(
                      children:[
                        Icon(Icons.filter_alt_rounded, color: AppColors.PRIMARY,),
                        Text('Filtres', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      ]
                  ),
                ), InkWell(
                  onTap: (){
                    showModalBottomSheet(context: context, builder: (context){
                      return const SortItemsWidget();
                    });
                  },
                  child: Row(
                      children: const [
                        Icon(Icons.arrow_upward_outlined, color: AppColors.PRIMARY,),
                        Icon(Icons.arrow_downward_outlined, color: AppColors.PRIMARY,),
                        Text('Prix', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                        SizedBox(width: 10,),
                      ]
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child:  GridView.builder(
                itemCount: 30,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 10, mainAxisExtent: 330),
                itemBuilder: (context, index){
                  return ProductByBoutique2(id: index,);
                }),
          ))
        ],
      ),
    ));
  }
}

