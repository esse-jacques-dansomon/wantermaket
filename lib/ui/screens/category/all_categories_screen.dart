import 'package:flutter/material.dart';
import 'package:wantermarket/ui/screens/category/widget/all_category_card.dart';

import '../../basewidgets/app_bars/app_bar_with_return_type2.dart';


class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: appBarWithReturnType2(title: 'Categories', context: context),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Text('Categories', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding : const EdgeInsets.only(left: 15.0, right: 15.0),
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 15,
                  itemBuilder: (context, index){
                    return AllCategoryCard(index: index,);
                  },
                  separatorBuilder: (context, index){
                    return const SizedBox(height: 15);
                  },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
