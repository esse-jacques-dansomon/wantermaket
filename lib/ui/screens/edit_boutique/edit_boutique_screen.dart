import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/providers/vendor_provider.dart';
import 'package:wantermarket/ui/basewidgets/app_bars/app_bar_with_return.dart';
import 'package:wantermarket/ui/screens/edit_boutique/widgets/boutique_form.dart';

import '../../basewidgets/drawer/drawer.dart';

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
                children:  [
                  BoutiqueForm(boutique: Provider.of<VendorProvider>(context, listen: false ).boutique,),
                ]
            ),
          ),
        ),
      ),
    );
  }
}
