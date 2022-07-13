import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/config/app_constantes.dart';
import 'package:wantermarket/config/app_dimenssions.dart';
import 'package:wantermarket/config/app_images.dart';
import 'package:wantermarket/providers/vendor_provider.dart';
import 'package:wantermarket/route/routes.dart';

import '../../../providers/auth_provider.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();

}

class _AppDrawerState extends State<AppDrawer> {

  Future<void> _loadDataBoutique() async {
     Provider.of<AuthProvider>(context, listen: false).getUserConnectedInfo();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadDataBoutique();
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
            child:  Provider.of<AuthProvider>(context, listen: true).isLoggedIn() ? Consumer<AuthProvider>(
              builder: (context, authProvider, _){
                return  Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Image.network(
                        Provider.of<AuthProvider>(context, listen: false).user.profilImage ==null ? AppImage.logo : AppConstants.BASE_URL_IMAGE + Provider.of<AuthProvider>(context, listen: false).user.profilImage! ,
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
                        Text(Provider.of<AuthProvider>(context, listen: false).user.boutiqueName ??'Pas de Nom', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: AppColors.WHITE),),
                        Text('@${Provider.of<AuthProvider>(context, listen: false).user.plan ?? 'Plan Encore de Plan'}', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.WHITE),),
                        Text('@${Provider.of<AuthProvider>(context, listen: false).user.boutiqueId ?? 'Plan de id'}', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.WHITE),),
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
                        SizedBox(width:MediaQuery.of(context).size.width*0.5 , child: const Text('Merci de creer un compte pour continuer', maxLines: 3, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.WHITE),)),
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

          Provider.of<AuthProvider>(context, listen: false).isLoggedIn() ?Column(
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

          const DrawerMenuItem(
            menuName: 'Mot de Passe',
            route: AppRoutes.forgotPassword,
            icon: Icons.password_outlined,
          ),

          !Provider.of<AuthProvider>(context, listen: false).isLoggedIn() ?
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
            children:  [
               const DrawerMenuItem(
                menuName: 'Dévénir exclusive',
                route: AppRoutes.become_exclusive,
                icon: Icons.star_half_outlined,
              ),
              ListTile(
                onTap: (){
                  Provider.of<AuthProvider>(context, listen: false).logout();
                  Provider.of<VendorProvider>(context, listen: false).clear();
                  Navigator.popAndPushNamed(context, AppRoutes.home);
                },
                horizontalTitleGap: 5,
                leading: const Icon( Icons.logout_outlined, color: AppColors.BLACK,),
                title: const Text('Se Deconnecter', style: TextStyle(color: AppColors.BLACK, fontSize: AppDimensions.FONT_SIZE_DEFAULT+2),),

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
      title: Text(menuName, style: const TextStyle(color: AppColors.BLACK, fontSize: AppDimensions.FONT_SIZE_DEFAULT+2),  ),
      onTap: () {
        Navigator.popAndPushNamed(context, route);
      },
    )  ;
  }
}

