import 'package:flutter/material.dart';
import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/config/app_dimenssions.dart';
import 'package:wantermarket/route/routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children:[
          DrawerHeader(
            // padding : const EdgeInsets.fromLTRB(20.0, 16.0, 16.0, 8.0),
            decoration: const BoxDecoration(
              color: AppColors.PRIMARY,
            ),
            child:  Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.network(
                    'https://avatars3.githubusercontent.com/u/17098281?s=460&v=4',
                    fit: BoxFit.cover,
                    height: 70,
                    width: 70,
                  ),
                ),
               const  SizedBox(width: 10,),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('WanterMarket', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: AppColors.WHITE),),
                    SizedBox(height: 5,),
                    Text('@wantermarket', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.WHITE),),
                  ],
                )

              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Column(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text('Bienvenue'),
          //           Text('Merci de creer otre compte'),
          //         ],
          //       ),
          //       ElevatedButton(onPressed: (){}, child: Text('Créer un compte'),),
          //     ],
          //   ),
          // ),
          const DrawerMenuItem(
            menuName: 'Accueil',
            route: AppRoutes.home,
            icon: Icons.home_outlined,
          ) ,
          const DrawerMenuItem(
            menuName: 'Categories',
            route: AppRoutes.categories,
            icon: Icons.category_outlined,
          ) ,
          const DrawerMenuItem(
            menuName: 'Boutique',
            route: AppRoutes.vendor,
            icon: Icons.shopping_bag_outlined,
          ) ,
          const DrawerMenuItem(
            menuName: 'Boutiques Favories',
            route: AppRoutes.favoritesBoutiques,
            icon: Icons.shop_2_outlined,
          ) ,
          const DrawerMenuItem(
            menuName: 'Ma Liste d\'Envies',
            route: AppRoutes.wishList,
            icon: Icons.favorite_border,
          ) ,
          const DrawerMenuItem(
            menuName: 'Notifications',
            route: AppRoutes.notification,
            icon: Icons.notifications_on_outlined,
          ),

          const DrawerMenuItem(
            menuName: 'Abonnements',
            route: AppRoutes.abonnements,
            icon: Icons.person_pin_rounded,
          ),
          ListTile(
            title: Text('Mon compte', style: TextStyle(fontSize: 17, color: Colors.grey[600]),),
          ),
          const DrawerMenuItem(
            menuName: 'Paramettres',
            route: AppRoutes.home,
            icon: Icons.settings,
          ) ,
          const DrawerMenuItem(
            menuName: 'Mot de Passe',
            route: AppRoutes.home,
            icon: Icons.password_outlined,
          ),
          const DrawerMenuItem(
            menuName: 'Se Deconnecter',
            route: AppRoutes.home,
            icon: Icons.logout_outlined,
          ),
          const DrawerMenuItem(
            menuName: 'Se connecter',
            route: AppRoutes.login,
            icon: Icons.login,
          ),
          const DrawerMenuItem(
            menuName: 'Créer un compte',
            route: AppRoutes.register,
            icon: Icons.person_add_alt,
          ),


        ]
      ),
    );
  }
}


class DrawerMenuItem extends StatelessWidget {
  final String route;
  final String menuName;
  final IconData icon;
  const DrawerMenuItem({Key? key, required this.route,required this.menuName,required this.icon, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 5,
      leading: Icon(icon, color: AppColors.BLACK,),
      title: Text(menuName, style: TextStyle(color: AppColors.BLACK, fontSize: AppDimensions.FONT_SIZE_DEFAULT+2),  ),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    )  ;
  }
}

