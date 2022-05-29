import 'package:flutter/material.dart';

import 'widgets/secteur_card.dart';

class SecteurScreen extends StatefulWidget {
  const SecteurScreen({Key? key}) : super(key: key);

  @override
  State<SecteurScreen> createState() => _SecteurScreenState();
}

class _SecteurScreenState extends State<SecteurScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Secteurs'),
      ),
    );
  }
}
