import 'package:flutter/material.dart';
import 'package:wantermarket/config/app_colors.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var params= [
        'Payements', 'Statistiques', 'Paramètres', 'Aide',
      'Analytics', 'Support', 'A propos', 'Déconnexion'
    ];
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipOval(
                      child:Image.asset(
                        "assets/images/logo.png",
                        fit: BoxFit.cover,
                        height: 80,
                        width: 80,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.03,),
                    Text(
                      "WanterMarket",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                        fontWeight: FontWeight.w600,
                        color: AppColors.PRIMARY,
                      ),
                    ),
                  ],
                ),



              ),
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.PRIMARY,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: AppColors.PRIMARY,
                        borderRadius: BorderRadius.only(
                          topLeft:  Radius.circular(30),
                          topRight:  Radius.circular(30),
                        ),

                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Container(
                            height: 90,
                            width: 90,
                            margin: const EdgeInsets.only(right: 20),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.PLACEHOLDER,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "100",
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.height * 0.03,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.WHITE,
                                  ),
                                ),
                                const Text(
                                  "Produits",
                                  style:  TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.PRIMARY,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 90,
                            width: 90,
                            margin: const EdgeInsets.only(right: 20),
                            padding: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              color: AppColors.PLACEHOLDER,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "\$100",
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.height * 0.03,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.WHITE,
                                  ),
                                ),
                                const Text(
                                  "Solde",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.PRIMARY,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 90,
                            width: 90,
                            padding: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              color: AppColors.PLACEHOLDER,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "1000",
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.height * 0.03,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.WHITE,
                                  ),
                                ),
                                const Text(
                                  "Vues/24h",
                                  style:  TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.PRIMARY,
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),

                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 15, top: 20, right: 15, bottom: 80),
                      decoration: const BoxDecoration(
                        color: AppColors.WHITE,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child:GridView.builder(
                        itemCount: 8,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.5,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            mainAxisExtent: 180,
                          ),
                          itemBuilder: (context, index){
                            return  Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                   SizedBox(
                                    height: 100,
                                    child: Image.asset(
                                      "assets/images/logo.png",
                                      fit: BoxFit.cover,
                                      height: 80,
                                      width: 100,
                                    ),
                                  ),
                                  const SizedBox(height: 15,),
                                  Text(
                                    params[index],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.PRIMARY,
                                    ),
                                  ),


                                ],
                              ),
                            );
                          }
                      ),
                    )
                  ],
                ),
              )

            ],

          ),
        ),

      ),
    );
  }
}
