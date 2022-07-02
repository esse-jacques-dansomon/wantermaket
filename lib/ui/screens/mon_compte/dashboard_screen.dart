
import 'package:flutter/material.dart';
import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/route/routes.dart';
import 'package:wantermarket/shared/app_helper.dart';
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
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                decoration: BoxDecoration(
                  color: AppColors.WHITE,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.BLACK.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  border: Border.all(
                    color: AppColors.PRIMARY.withOpacity(0.1),
                    width: 2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 75,
                          height:75,
                          child: ClipOval(
                            child: Image.network(
                              'https://i.pravatar.cc/300',
                              fit: BoxFit.cover,
                              width: 75,
                              height: 75,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 15),
                          child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text('Agence Cauris',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text('Marketing & Communication',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              SizedBox(height: 5),

                              Text('Senegal, Dakar ',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 10,),
                        Row(
                          children:  const [
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

                            }, child: const Text('Editer Profile'))),
                            const SizedBox(width: 10,),
                            Expanded(child: ElevatedButton(onPressed: (){
                              Navigator.pushNamed(context, AppRoutes.editboutiqueBySecteur);
                            }, child: const Text('Editer Boutique'))),
                          ],
                        ),
                        //STATISTIQUES
                        const SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.WHITE,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.BLACK.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            border: Border.all(
                              color: AppColors.PRIMARY.withOpacity(0.1),
                              width: 2,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const  Expanded( child:  StatItem(name: 'Produits Restants',value: 40,), flex: 2,),
                              Container(
                                width: 2,
                                height: 45,
                                margin: const EdgeInsets.symmetric(horizontal: 20),
                                color: AppColors.PRIMARY,
                              ),
                              const Expanded(flex: 2, child:  StatItem(name: 'Vues Boutique',value: 60,)),

                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.WHITE,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.BLACK.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            border: Border.all(
                              color: AppColors.PRIMARY.withOpacity(0.1),
                              width: 2,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(child:  StatItem(name: 'Produits',value: 40,)),
                              Container(
                                width: 2,
                                height: 45,
                                margin: const EdgeInsets.symmetric(horizontal: 20),
                                color: AppColors.PRIMARY,
                              ),
                             const Expanded(child: const StatItem(name: 'Abonnés',value: 60,)),

                            ],
                          ),
                        ),
                        const SizedBox(height: 25,),


                      ],
                    ),
                  ],
                ),
              ),

              Container(
                margin : const EdgeInsets.only(bottom: 20, top: 10),
                child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      const Expanded(child: const Divider(color: Colors.grey,),),
                      Container( padding: const EdgeInsets.symmetric(horizontal: 10), child: const Text('Mes Produits', textAlign: TextAlign.center, style: TextStyle(fontSize: 18),)),
                      const Expanded(child: Divider(color: Colors.grey,),),
                    ]
                ),
              ),
              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: AppHelper.getCrossAxisCount(context, width: 230),
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
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:  [
                                    Text(AppHelper.priceFormat(price: "2000000"), maxLines: 2, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: AppColors.SECONDARY),),
                                    const SizedBox(height: 5,),
                                    const Text('Mack Book 2021 256Giga venu', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 13),),
                                    const SizedBox(height: 5,),
                                    Row(
                                      children: [
                                        Row(
                                          children: const [
                                            Icon(Icons.remove_red_eye, color: Colors.grey,),
                                            SizedBox(width: 10,),
                                            Text('1000'),
                                            SizedBox(width: 10,),
                                            Text('Vues')
                                          ],
                                        ),

                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          height:25,
                                          child: ElevatedButton(
                                              style: const ButtonStyle(

                                              ),
                                              onPressed: (){}, child: const Text('Modifier')),
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
                              )),

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

class StatItem extends StatelessWidget {
  final String name; final double value;
  const StatItem({
    Key? key,
    required this.name, required this.value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:  [
          Text('$value', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.PRIMARY),),
          const SizedBox(height: 7,),
          Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.PRIMARY),),
        ],
      ),
    );
  }
}
