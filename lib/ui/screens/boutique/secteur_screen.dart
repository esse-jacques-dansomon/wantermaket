import 'package:flutter/material.dart';

import '../../widgets/app_bar.dart';


class SecteurScreen extends StatefulWidget {
  const SecteurScreen({Key? key}) : super(key: key);

  @override
  State<SecteurScreen> createState() => _SecteurScreenState();
}

class _SecteurScreenState extends State<SecteurScreen> {

   Widget _selectedExtras(){
    return Card(
      shadowColor: Colors.black,
      child: Column(
        mainAxisAlignment:  MainAxisAlignment.center,
        children: [
          
          Container(
            height: 90,
            decoration:  const BoxDecoration(
              image:  DecorationImage(
                image:  AssetImage('assets/images/agroalimentaire.png'),
                fit:  BoxFit.cover,
              ),
            ),
    
          ),
          const  SizedBox(height: 10,),
          const Text('Agroalimentaria',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    //final cardSize = MediaQuery.of(context).size.width / 2 - 32;
    return SafeArea(
      child: Scaffold(
        appBar: appBar(),
        drawer: newDrawer(MediaQuery.of(context).size.height),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //prendre la taille de l'écran
    
          children:  [
             const Padding(
              padding: EdgeInsets.only(left: 10, right: 15, top: 5),
              child: Text(
                "Nos secteurs",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, top: 0, bottom: 10),
              child: Text(
                'Retrouvez les boutiques par secteurs',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
        Expanded(
             child: Padding(
               padding: const EdgeInsets.only(left: 10, right: 10),
               child: GridView.builder(
                           itemCount: 40,
                           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 8,
                              childAspectRatio: 1.30,
                           ),
                           itemBuilder: (context, index) {
                             return  _selectedExtras();
                           },
                         ),
             )
               ),
          ],
        ),
      ),
    );
  }
}
