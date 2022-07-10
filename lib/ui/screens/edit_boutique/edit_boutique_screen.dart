import 'package:flutter/material.dart';
import 'package:wantermarket/ui/basewidgets/app_bars/app_bar_with_return.dart';
import 'package:wantermarket/ui/screens/edit_boutique/widgets/boutique_form.dart';

import '../../basewidgets/app_bars/drawer.dart';

class EditBoutiqueScreen extends StatelessWidget {
  const EditBoutiqueScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithReturn(title: 'Editer boutique', context: context),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics:  const BouncingScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  // SizedBox(height: 20,),
                  // Text("Editer votre boutique", textAlign: TextAlign.start, style: TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE, color: AppColors.BLACK),),
                  // SizedBox(height: 10,),
                  BoutiqueForm(),
                ]
            ),
          ),
        ),
      ),
    );
  }
}
