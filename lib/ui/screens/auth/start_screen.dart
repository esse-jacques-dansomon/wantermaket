import 'package:flutter/material.dart';

import '../../../config/app_colors.dart';
import '../../../route/routes.dart';

class LoginOrLogupScreen extends StatelessWidget {
  const LoginOrLogupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color:  Colors.white,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.5,
              decoration: const BoxDecoration(
                color: AppColors.PRIMARY,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
            ),
            Positioned(
              child: SizedBox(
              width: MediaQuery.of(context).size.width-40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                      child: Image.asset('assets/images/logo.png'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: MediaQuery.of(context).size.height*0.55,
                    width: double.infinity,
                    decoration:  BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius:const BorderRadius.all( Radius.circular(20)),                  ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:  [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: const [
                              SizedBox(
                                height: 10,
                              ),
                              Text('Bienvenue Sur Wanter Market',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Créez votre boutique et commencez à vendre vos produits dès maintenant',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.75,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, AppRoutes.register);

                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                AppColors.PRIMARY,
                              ),
                            ),
                            child: const Text(
                              'Créer votre boutique',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,

                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.75,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, AppRoutes.login);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Colors.white,
                              ),
                              foregroundColor: MaterialStateProperty.all(
                                AppColors.PRIMARY,
                              ),
                            ),
                            child: const Text(
                              'Se connecter',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.75,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, AppRoutes.home);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Colors.white,
                              ),
                              foregroundColor: MaterialStateProperty.all(
                                AppColors.PRIMARY,
                              ),
                            ),
                            child: const Text(
                              'Continuer sans compte',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // Container(
                        //   width: MediaQuery.of(context).size.width*0.75,
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //     children:const [
                        //       Expanded( flex: 2,child: Divider(color: Colors.grey, height: 5,),),
                        //       Expanded(flex: 3, child: Text('Ou Creer avec', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),),),
                        //       Expanded(flex: 2,child: Divider(color: Colors.grey, height: 5,),),
                        //     ],
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Container(
                        //       margin: const EdgeInsets.symmetric(horizontal: 8),
                        //       decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.all(Radius.circular(10)),
                        //         color: Colors.blue,
                        //       ),
                        //       height: 50,
                        //       width: 50,
                        //       child: Icon(Icons.facebook, color: Colors.white,),
                        //     ),
                        //     Container(
                        //       margin: const EdgeInsets.symmetric(horizontal: 8),
                        //
                        //       decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.all(Radius.circular(10)),
                        //         color: Colors.green,
                        //       ),
                        //       height: 50,
                        //       width: 50,
                        //       child: Icon(Icons.whatsapp, color: Colors.white,),
                        //     ),
                        //     Container(
                        //       margin: const EdgeInsets.symmetric(horizontal: 8),
                        //       decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.all(Radius.circular(10)),
                        //         color: Colors.black,
                        //       ),
                        //       height: 50,
                        //       width: 50,
                        //       child: Icon(Icons.phone_android, color: Colors.white,),
                        //     ),
                        //   ],
                        // ),



                      ],
                    ),
                    ),




                ],
              ),
            ),),
          ],
        ),
      ),
    );
  }
}
