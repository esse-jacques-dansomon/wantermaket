import 'package:flutter/material.dart';
import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/route/routes.dart';
import 'package:wantermarket/ui/basewidgets/app_bars/drawer.dart';

import '../../basewidgets/app_bars/app_bar.dart';
import '../../basewidgets/bottom_bar/bottom_nav_bar.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const CustomBottomNavBar(profile: true,),
        appBar: appBar(isActiveSearchbar: true),
        drawer: const AppDrawer(),
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
                          width: MediaQuery.of(context).size.width * 0.7,
                          margin: const EdgeInsets.only(left: 10),
                          child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text('Esse Jacques Dansomon',
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
                              Text('Senegal ',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 10,),
                  Row(
                    children:  [
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
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Expanded(child: ElevatedButton(onPressed: (){
                        Navigator.pushNamed(context, AppRoutes.register);

                      }, child: Text('Editer Profile'))),
                      const SizedBox(width: 10,),
                      Expanded(child: ElevatedButton(onPressed: (){
                        Navigator.pushNamed(context, AppRoutes.editboutiqueBySecteur);
                      }, child: Text('Editer Boutique'))),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text('40', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                            Text('produits', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text('60', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                            Text('reste produits', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text('1000000', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                            Text('solde', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.grey),),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text('500', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                            Text('Followers', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text('600', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                            Text('Vues Boutiques', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text('', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                            Text('', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.grey),),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Container(
                margin : const EdgeInsets.only(bottom: 20, top: 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
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
                      mainAxisExtent: 320
                  ),
                  itemCount: 50,
                  itemBuilder : (context, index){
                    return Card(
                      child: Column(
                        children: [
                          Stack(
                            clipBehavior: Clip.hardEdge,
                            children:  [
                              SizedBox(
                                width: double.infinity,
                                height: 180,
                                child: Image.network(
                                  'https://i.pravatar.cc/30${index+1}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 5,),
                          Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('Mack Book 2021 256Giga', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 17),),
                                  SizedBox(height: 5,),
                                  Text('FCFA 1 750 000', maxLines: 2, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)
                                ],
                              )),
                          const SizedBox(height: 5,),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.remove_red_eye, color: Colors.grey,),
                                  SizedBox(width: 4,),
                                  Text('Vues')

                                ],
                              ),
                              SizedBox(width: 10,),
                              Text('1000')
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height:25,
                                child: ElevatedButton(
                                    style: ButtonStyle(

                                    ),
                                    onPressed: (){}, child: Text('Modifier')),
                              ),
                              //on off button
                              Switch(
                                value: true,
                                onChanged: (value){},
                              ),
                            ],
                          )
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
