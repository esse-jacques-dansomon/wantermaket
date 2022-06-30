import 'package:flutter/material.dart';

class ProductFoundFilter extends StatelessWidget {
  const ProductFoundFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            Expanded(child: Container(
              margin: const EdgeInsets.only(right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Filtres', style:TextStyle(
                    fontSize: 20,
                  )),
                  IconButton(
                    icon: Icon(Icons.close_rounded, color: Colors.white,),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),

                ],
              ),
            ))
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  //filter by price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Prix', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      Slider(
                        value: 0.5,
                        min: 0,
                        max: 1,
                        divisions: 10,
                        label: '${(0.5 * 100).toInt()}',
                        activeColor: Colors.green,
                        inactiveColor: Colors.grey,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                 //by attribute
                  const Divider(
                    color: Colors.grey,
                    height: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     const Text('Type', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                     const SizedBox(
                        width: 20,
                      ),
                      DropdownButton(

                        hint: const Text('FIltre par default'),
                        value: 'Popularité',
                        items: const [
                          DropdownMenuItem(
                            child: Text('Popularité'),
                            value: 'Popularité',
                          ),
                          DropdownMenuItem(
                            child: Text('Prix : le moins au plus'),
                            value: 'Prix : le moins au plus',
                          ),
                          DropdownMenuItem(
                            child: Text('Prix : le plus au moins'),
                            value: 'Prix : le plus au moins',
                          ),
                          DropdownMenuItem(
                            child: Text('nouveautés'),
                            value: 'nouveautés',
                          ),
                        ], onChanged: (String? value) {  },
                      ),
                    ],
                  ),

                 const Divider(
                    color: Colors.grey,
                    height: 1,
                  ),
                  //filter by category
                  SizedBox(height: 15,),
                  Container( alignment: Alignment.centerLeft, child: const Text('Secteurs', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
                  SizedBox(height: 15,),

                  const Divider(
                    color: Colors.grey,
                    height: 1,
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                            color: Colors.grey[200],
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Text('Nouveautés  $index',
                                style: TextStyle(fontSize: 16, color: Colors.black),),
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
