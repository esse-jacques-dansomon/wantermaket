import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';
import 'package:wantermarket/data/fakedata/categorie_json.dart';

import '../../../config/app_colors.dart';

AppBar appBar({bool isActiveSearchbar=false}) {
  return AppBar(
    automaticallyImplyLeading: false,
    toolbarHeight: 70,
    elevation: 0,
    backgroundColor: AppColors.WHITE,
    iconTheme: const IconThemeData(color: AppColors.PRIMARY, size: 28),
    actions: [

      Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.menu_sharp),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),),
      isActiveSearchbar? Expanded(
        child: Center(
          child: Container(
            height:40,
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: Center(
              child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    contentPadding: EdgeInsets.only(left: 15),
                    hintText: 'Rechercher',
                    alignLabelWithHint : true,
                    suffixIcon: Icon(Icons.search),
                  ),
                  textAlign: TextAlign.start,
                  textAlignVertical : TextAlignVertical.center
              ),
            ),
          ),
        ),
      ): Expanded(child: Container()),
      Center(
        child: DropdownButton(
          alignment :AlignmentDirectional.bottomEnd,
          underline: DropdownButtonHideUnderline(child: Container(),) ,
          hint: const Text('SN'),
          value: 'SN',
          elevation: 0,
          items:   [
            DropdownMenuItem(
              alignment: Alignment.center,
              value: 'SN',
              child: Container(
                alignment: Alignment.center,
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleFlag('sn', size: 25,),
                      // SizedBox(width: 3),
                      // Text('SN', style: TextStyle(
                      //   fontSize: 16,
                      //   fontWeight: FontWeight.bold,
                      //   color: AppColors.PRIMARY,
                      // ),)
                    ],
                  ),
                ),
              ),
            ),
            DropdownMenuItem(
              value: 'TG',
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleFlag('tg', size: 25,),
                    // SizedBox(width: 3),
                    // Text('TG', style: TextStyle(
                    //   fontSize: 16,
                    //   fontWeight: FontWeight.bold,
                    //   color: AppColors.PRIMARY,
                    // ),)
                  ],
                ),
              ),
            ),
          ], onChanged: (String? value) {  },
        ),
      ),


    ],
  );
}




Drawer newDrawer(double height){
  return  Drawer(
    elevation: 0,

    child: ListView(
      children: [
        SizedBox(
          height: height,
          child: ListView.builder(
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              return MenuItem(name:categories[index]['name']+index.toString()+'/'+ categories.length.toString(), sousCategories: categories[index]['name'],);
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
