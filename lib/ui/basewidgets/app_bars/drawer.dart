import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/config/app_constantes.dart';
import 'package:wantermarket/config/app_dimenssions.dart';
import 'package:wantermarket/route/routes.dart';

import '../../../providers/auth_provider.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();

}

class _AppDrawerState extends State<AppDrawer> {

  Future<void> _loadDataBoutique() async {
     Provider.of<AuthProvider>(context, listen: false).getUserShop();
     Provider.of<AuthProvider>(context, listen: false).getUserConnectedInfo();

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(Provider.of<AuthProvider>(context, listen: false).isLoggedIn()) {
      _loadDataBoutique();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children:[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.PRIMARY,
            ),
            child:  Provider.of<AuthProvider>(context).isLoggedIn() ? Consumer<AuthProvider>(
              builder: (context, authProvider, _){
                return  Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Image.network(
                        AppConstants.BASE_URL_IMAGE +Provider.of<AuthProvider>(context, listen: false).user.profilImage! ,
                        fit: BoxFit.cover,
                        height: 70,
                        width: 70,
                      ),
                    ),
                    const  SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Text(Provider.of<AuthProvider>(context, listen: false).user.boutiqueName!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: AppColors.WHITE),),
                        const SizedBox(height: 5,),
                        Text('@${Provider.of<AuthProvider>(context, listen: false).user.plan!}', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.WHITE),),
                      ],
                    )

                  ],
                );
              }
            ) : Padding(
              padding: const EdgeInsets.all(0.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Bienvenue', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: AppColors.WHITE),),
                        const SizedBox(height: 10,),
                        SizedBox(width:MediaQuery.of(context).size.width*0.5 , child: Text('Merci de creer un compte pour continuer', maxLines: 3, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.WHITE),)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

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

          Provider.of<AuthProvider>(context).isLoggedIn() ?Column(
            children: const [
              DrawerMenuItem(
                menuName: 'Boutiques Favories',
                route: AppRoutes.favoritesBoutiques,
                icon: Icons.shop_2_outlined,
              ) ,

              DrawerMenuItem(
                menuName: 'Notifications         0',
                route: AppRoutes.notification,
                icon: Icons.notifications_on_outlined,

              ),
            ],
          ) : Container(),

          const DrawerMenuItem(
            menuName: 'Abonnements',
            route: AppRoutes.abonnements,
            icon: Icons.person_pin_rounded,
          ),
          const DrawerMenuItem(
            menuName: 'Ma Liste d\'Envies',
            route: AppRoutes.wishList,
            icon: Icons.favorite_border,
          ) ,
          ListTile(
            title: Text('Mon compte', style: TextStyle(fontSize: 17, color: Colors.grey[600]),),
          ),



          !Provider.of<AuthProvider>(context).isLoggedIn() ?
          Column(
            children: const [
              DrawerMenuItem(
                menuName: 'Se connecter',
                route: AppRoutes.login,
                icon: Icons.login,
              ),
              DrawerMenuItem(
                menuName: 'Créer un compte',
                route: AppRoutes.register,
                icon: Icons.person_add_alt,
              ),
            ],
          )

          :Column(
            children: const [
               DrawerMenuItem(
                menuName: 'Dévénir exclusive',
                route: AppRoutes.become_exclusive,
                icon: Icons.star_half_outlined,
              ),
              DrawerMenuItem(
                menuName: 'Mot de Passe',
                route: AppRoutes.forgotPassword,
                icon: Icons.password_outlined,
              ),
              DrawerMenuItem(
                menuName: 'Se Deconnecter',
                route: AppRoutes.home,
                icon: Icons.logout_outlined,
              ),
            ],
          )


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

