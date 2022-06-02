import 'package:flutter/material.dart';
import 'package:wantermarket/ui/widgets/app_bar.dart';

import 'widgets/secteur_card.dart';

class SecteurScreen extends StatefulWidget {
  const SecteurScreen({Key? key}) : super(key: key);

  @override
  State<SecteurScreen> createState() => _SecteurScreenState();
}

class _SecteurScreenState extends State<SecteurScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: appBar(),
        body: const Center(
          child: Text('Secteurs'),
        ),
      ),
    );
  }
}
