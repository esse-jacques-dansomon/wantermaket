import 'package:flutter/material.dart';
import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/ui/basewidgets/app_bars/drawer.dart';

import '../../basewidgets/app_bars/app_bar.dart';
import '../../basewidgets/bottom_bar/bottom_nav_bar.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var params= [
      'Payements', 'Statistiques', 'Paramètres', 'Aide',
      'Analytics', 'Support', 'A propos', 'Déconnexion'
    ];
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const CustomBottomNavBar(profile: true,),
        appBar: appBar(isActiveSearchbar: true),
        drawer: AppDrawer(),
        backgroundColor: AppColors.WHITE,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10) ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: ClipOval(
                            child: Image.network(
                              'https://i.pravatar.cc/300',
                              fit: BoxFit.cover,
                              width: 80,
                              height: 80,
                            ),
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.34,
                            margin: EdgeInsets.only(left: 10),
                            child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text('Nom et Prénom',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text('Nom et Prénom',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Text('Senagal',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),

                              ],)),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.37,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,

                              children: [
                                IconButton(onPressed: (){}, icon: Icon(Icons.ios_share),),
                                IconButton(onPressed: (){}, icon: Icon(Icons.qr_code),),
                                IconButton(onPressed: (){}, icon: Icon(Icons.settings),),
                              ],
                            ))

                      ],
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 10,),
                  Row(
                    children: const [
                      Text('Membre depuis le',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(width: 40,),
                      Text('01/01/2020',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Container(
              //   height: 100,
              //   margin: const EdgeInsets.only(top: 10),
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //
              //       ClipOval(
              //         child: Container(
              //           width: 70,
              //           height: 70,
              //           color: Colors.red,
              //           child: Center(
              //             child: Icon(Icons.monetization_on, size: 38, color: Colors.white,),
              //           ),
              //         ),
              //       ),
              //       SizedBox(width: 20,),
              //       ClipOval(
              //         child: Container(
              //           width: 70,
              //           height: 70,
              //           color: Colors.green,
              //           child: Center(
              //             child: Icon(Icons.wallet, size: 38, color: Colors.white,),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Container(
                margin : EdgeInsets.only(bottom: 20, top: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Mes Produits', textAlign: TextAlign.center, style: TextStyle(fontSize: 18),)
                    ]
                ),
              ),
              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 250
                  ),
                  itemCount: 50,
                  itemBuilder : (context, index){
                    return Card(
                      child: Column(
                        children: [
                          Stack(
                            clipBehavior: Clip.hardEdge,
                            children: [
                              Container(

                                width: double.infinity,
                                height: 180,
                                child: Image.network(
                                  'https://i.pravatar.cc/30${index}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              //mark as favorite
                              // Positioned(
                              //   top: 5,
                              //   right: 5,
                              //   child: Container(
                              //     width: 30,
                              //     height: 30,
                              //     decoration: BoxDecoration(
                              //       color: Colors.white,
                              //       borderRadius: BorderRadius.circular(5),
                              //     ),
                              //     child: Icon(Icons.favorite_border),
                              //   ),
                              // ),
                              //mark as sold
                              false ? Positioned(
                                top: 5,
                                left: 0,
                                child: Container(
                                  width: 100,
                                  height: 30,
                                  padding: const EdgeInsets.only(left: 10),
                                  alignment: Alignment(-1, 0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  child: Text('SOLD', style: TextStyle(fontSize: 17, color: Colors.red),),
                                ),
                              ): Container(),
                            ],
                          ),
                          const SizedBox(height: 5,),
                          Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Mack Book 2021 256Giga', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 17),),
                                  SizedBox(height: 5,),
                                  Text('FCFA 1 750 000', maxLines: 2, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)

                                ],
                              )),
                          const SizedBox(height: 10,)
                        ],
                      ),
                    );
                  }
              )
            ],
          ),

        ),
      ),
    );
  }
}
