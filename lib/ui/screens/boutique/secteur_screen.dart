import 'package:flutter/material.dart';

import '../../widgets/app_bar.dart';


class SecteurScreen extends StatefulWidget {
  const SecteurScreen({Key? key}) : super(key: key);

  @override
  State<SecteurScreen> createState() => _SecteurScreenState();
}

class _SecteurScreenState extends State<SecteurScreen> {

   Widget _selectedExtras(){
    return Container(
      
     decoration:BoxDecoration(
        borderRadius:BorderRadius.circular(10.0),
          border:Border.all(color:Colors.grey,width:2)
        ),
        child:  Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children: [
            
            Container(
              height: 60,
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
        ),// BoxDecoration
    );
  }
  
  @override
  Widget build(BuildContext context) {
    //final cardSize = MediaQuery.of(context).size.width / 2 - 32;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
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

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 300,
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1.30,
                    children: [
                      _selectedExtras(),
                      _selectedExtras(),
                      _selectedExtras(),
                      _selectedExtras(),
                      _selectedExtras(),
                      _selectedExtras(),
                      _selectedExtras(),
                      _selectedExtras(),
                    ],
                    )
                ),
            ),
            
          ],
        ),
      ),
    );
  }
}
