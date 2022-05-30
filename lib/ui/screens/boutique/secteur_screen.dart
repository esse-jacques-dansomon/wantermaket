import 'package:flutter/material.dart';

import '../../widgets/app_bar.dart';


class SecteurScreen extends StatefulWidget {
  const SecteurScreen({Key? key}) : super(key: key);

  @override
  State<SecteurScreen> createState() => _SecteurScreenState();
}

class _SecteurScreenState extends State<SecteurScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      drawer: newDrawer(MediaQuery.of(context).size.height),
      body: const 
      
    Center(
        child: Text('Secteurs'),
      ),
    );
  }
}
