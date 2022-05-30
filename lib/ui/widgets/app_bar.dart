import 'package:flutter/material.dart';
import 'package:wantermarket/data/categorie_json.dart';

import '../../config/app_colors.dart';

AppBar appBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.greenAccent,
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.account_box_outlined, color: Colors.white,),
      ),
      IconButton(
        onPressed: () {
        },
        icon: Icon(Icons.shopping_cart_outlined, color: Colors.white,),
      ),
    ],
  );
}




Drawer newDrawer(double height){
  return  Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(
          height: height,
          child: ListView.builder(
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              return MenuItem(name:categories[index]['name'], sousCategories: categories[index]['name'],);
            },
          ),
        ),

      ],
    ),
  );
}

class MenuItem extends StatelessWidget {
  final String name;
  final dynamic sousCategories;
  const MenuItem({
    Key? key, required this.name, required this.sousCategories
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(

      children: [

        Expanded(
          child: ExpansionTile(
            leading:  Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image:DecorationImage(
                      image:  NetworkImage(
                        'https://picsum.photos/200/300',
                      ), fit: BoxFit.cover
                  )
              ),
            ),
            title: Text(name, style: TextStyle(color: Colors.black, fontSize: 20),),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    height: 400,
                    child: ListView.builder(
                        itemCount: 8,
                          itemBuilder: (context, index){
                          return InkWell(
                            onTap: (){},
                            child: Padding(
                                padding: EdgeInsets.only(left: 50, top: 5, bottom: 10),
                              child: Text('sous categorie $index', style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400
                              )),

                            ),
                          );
                          }

                      )

                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
