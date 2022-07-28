import 'package:flutter/material.dart';

import '../../../../config/app_colors.dart';

class ProductFoundFilter extends StatelessWidget {
  const ProductFoundFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white70,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            Expanded(child: Container(
              margin: const EdgeInsets.only(right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  const Text('Cancel', style:TextStyle(
                    fontSize: 20,color: AppColors.BLACK
                  )),
                  const Text('Filtres', style:TextStyle(
                    fontSize: 20, color: AppColors.BLACK
                  )),
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: const Text('Done', style:TextStyle(
                    fontSize: 20, color: AppColors.BLACK,
                  )))
                  ,

                ],
              ),
            ))
          ],
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.only(top: 0.0, ),
              child: Column(
                children: [
                  //filter by price
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(15),color: Colors.grey[200], child: const Text('Prix', textAlign: TextAlign.start, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),

                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  const [
                           Divider(
                              color: Colors.grey,
                              height: 1,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Slider(
                          value: 20,
                          min: 0,
                          max: 100,
                          divisions: 10,
                          label: '${(0.5 * 1000).toInt()}',
                          activeColor: Colors.green,
                          inactiveColor: Colors.grey,
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                 //by attribute
                  const Divider(
                    color: Colors.grey,
                    height: 1,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(15),color: Colors.grey[200], child: Text('Trier par', textAlign: TextAlign.start, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0, right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  const [
                            ListTile(
                              title: Text('Popularité'),
                              trailing: Icon(Icons.check_circle, color: AppColors.PRIMARY,),
                            ),

                             Divider(
                              color: Colors.grey,
                              height: 1,
                            ),
                            ListTile(
                              title: Text('Nouveautés'),
                              trailing: Icon(Icons.check_circle, color: AppColors.PRIMARY,),
                            ),
                            Divider(
                              color: Colors.grey,
                              height: 1,
                            ),
                            ListTile(
                              title: Text('Prix le plus bas'),
                              trailing: Icon(Icons.check_circle, color: AppColors.PRIMARY,),
                            ),
                            Divider(
                              color: Colors.grey,
                              height: 1,
                            ),
                            ListTile(
                              title: Text('Prix le plus élevé'),
                              trailing: Icon(Icons.check_circle, color: AppColors.PRIMARY,),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),

                  Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(15),color: Colors.grey[200], child: Text('Secteurs', textAlign: TextAlign.start, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.only(left: 15, right: 15 ),
                      itemBuilder: (context, index) {
                        return Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            border: Border.all(color: Colors.white, width: 0),
                            color: Colors.white,

                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Text('Nouveautés  $index',
                                style: const TextStyle(fontSize: 16, color: Colors.black),),
                              //chekbox
                              const SizedBox(
                                width: 10,
                              ),
                              Checkbox(
                                value: false, onChanged: (bool? value) {

                              },
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: 10,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 10,);
                      },
                    ),
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Filtrer', style: TextStyle(color: Colors.white, fontSize: 20),),

                    ),
                  )


                ],
              ),
            ),
          ),
        )
        ),
    );


  }
}
