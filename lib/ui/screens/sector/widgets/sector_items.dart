import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/providers/category_provider.dart';
import 'package:wantermarket/shared/app_helper.dart';
import 'package:wantermarket/ui/basewidgets/cards/sector_card_widget.dart';

class SectorItems extends StatelessWidget {
  const SectorItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                return  SectorCard(category : categoryProvider.categories[index]);
              },
            ),
          ),
        )
    );
  }
}
