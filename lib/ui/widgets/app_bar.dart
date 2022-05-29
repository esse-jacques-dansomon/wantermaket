import 'package:flutter/material.dart';
import 'package:wantermarket/data/categorie_json.dart';

import '../../config/app_colors.dart';

AppBar appBar() {
  return AppBar(
    // leading: IconButton(
    //   icon: Image.asset('assets/images/logo.png'),
    //   onPressed: () {},
    // ),
    elevation: 0,
    backgroundColor: Colors.greenAccent,
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.account_box_outlined, color: Colors.black,),
      ),
      IconButton(
        onPressed: () {
        },
        icon: Icon(Icons.shopping_cart_outlined, color: Colors.black,),
      ),


    ],
  );
}




newDrawer(BuildContext context){
  return  Drawer(

    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
          ),
          child: ListView.builder(
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              return MenuItem(name:categories[index]['name'] ,);
            },
          ),
        ),

      ],
    ),
  );
}

class MenuItem extends StatelessWidget {
  final String name;
  const MenuItem({
    Key? key, required this.name
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ExpansionTile(
      title: Text(name, style: TextStyle(color: Colors.black, fontSize: 20),),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                Text('Sous categorie 1'),
                Text('Sous categorie 1'),
                Text('Sous categorie 1'),
                Text('Sous categorie 1'),

              ]
            ),
          ),
        ),
      ],
    );
  }
}
