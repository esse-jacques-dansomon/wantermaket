import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/providers/category_provider.dart';
import 'package:wantermarket/ui/screens/category/widget/all_category_card.dart';

import '../../basewidgets/app_bars/app_bar_with_return.dart';


class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithReturn(title: 'Categories', context: context),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const Padding(padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
              // child: Text('Categories', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              // ),
              Padding(
                padding : const EdgeInsets.only(left: 15.0, right: 15.0, top: 20),
                child: Consumer<CategoryProvider>(
                  builder: (context, categoryProvider, _){
                    return  ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: categoryProvider.categories.length,
                      itemBuilder: (context, index){
                        return AllCategoryCard(category: categoryProvider.categories[index],);
                      },
                      separatorBuilder: (context, index){
                        return const SizedBox(height: 15);
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
