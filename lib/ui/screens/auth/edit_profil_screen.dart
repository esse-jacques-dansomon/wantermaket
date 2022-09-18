// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:wantermarket/route/routes.dart';
import 'package:wantermarket/ui/basewidgets/app_bars/app_bar_with_return.dart';
import 'package:wantermarket/ui/screens/auth/widgets/edit_profile_form_widget.dart';
import 'package:wantermarket/ui/screens/auth/widgets/register_form_widget.dart';

import '../../../config/app_colors.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithReturn(title: 'Editer Profile', context: context),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              //form
               Center(child: EditProfileFormWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
