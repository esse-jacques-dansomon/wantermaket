import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/route/routes.dart';
import 'package:wantermarket/shared/app_helper.dart';

import '../../../config/app_colors.dart';
import '../../../providers/auth_provider.dart';

class CustomBottomNavBar extends StatelessWidget {
  final bool add_product;
  final bool boutique;
  final bool home;
  final bool profile;
  final bool search;
  final ScrollController? scrollController;

  const CustomBottomNavBar(
      {Key? key,
        this.add_product = false,
        this.boutique = false,
        this.home = false,
        this.profile = false,
        this.search = false,
        this.scrollController

      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //if is ios set height to 80
      height: Platform.isIOS ? 80 : 65,
      color: AppColors.PRIMARY,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Platform.isIOS ? 80 : 65,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.white,
              child: Row(
                mainAxisAlignment:  MainAxisAlignment.spaceBetween ,
                children: [
                  CustomBottomBarItem(
                    activeImage:Icons.home,
                    image:Icons.home_outlined,
                    title: 'Accueil',
                    route: AppRoutes.home,
                    item: home,
                    scrollController: scrollController,
                  ),
                  CustomBottomBarItem(
                    activeImage:Icons.shop,
                    image:Icons.shop_outlined,
                    title: 'Boutiques',
                    route: AppRoutes.shop,
                    item: boutique,
                    scrollController: scrollController,

                  ),
                  AddProduct(item: add_product,),
                  CustomBottomBarItem(
                    activeImage:Icons.search,
                    image:Icons.search_outlined,
                    title: 'Recherche',
                    route: AppRoutes.search,
                    item: search ,
                    scrollController: scrollController,

                  ),
                  CustomBottomBarItem(
                    activeImage:Icons.person,
                    image:Icons.person_outlined,
                    title: 'Profile',
                    route: AppRoutes.profile,
                    item: profile,
                    scrollController: scrollController,

                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBottomBarItem extends StatelessWidget {
  const CustomBottomBarItem({
    Key? key,
    required this.item,
    required this.route,
    required this.title,
    required this.image,
    required this.activeImage,
    this.scrollController,

  }) : super(key: key);

  final bool item;
  final String route;
  final String title;
  final IconData image;
  final IconData activeImage;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context, ) {
    return GestureDetector(
      onTap: () {
        if (!item) {
          AppRoutes.goTo(context, route);
        }else{
          if(scrollController != null ){
            scrollController?.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
          }
        }
      },
      child: Container(
        padding: EdgeInsets.only(top: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            item ? Icon(activeImage, color: AppColors.PRIMARY, size: 26,) : Icon(image,  size: 25),
            item ? Text(title, style: const TextStyle(color: AppColors.PRIMARY, fontWeight: FontWeight.bold, fontSize: 13))
                : Text(title, style : const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key,  required this.item,}) : super(key: key);
  final bool item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Container(
                height: 280,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                padding: const EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Créer', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close),
                        )
                      ],
                    ),
                    SizedBox(height: 15,),
                    AddProductItem(icon: Icons.add_circle, title: "Ajouter un produit", route: AppRoutes.addProduct),
                    Provider.of<AuthProvider>(context, listen: false).isActivePayment() ? Column(
                      children: [
                        SizedBox(height: 20,),
                        AddProductItem(icon: Icons.star,title: "Dévenir exclusive", route: AppRoutes.becomeExclusive),
                        SizedBox(height: 20,),
                        AddProductItem(icon: Icons.add_box,title: "Faire un abonnement", route: AppRoutes.abonnements),
                      ],
                    ) : Container(),
                  ],
                ),
              );
            });

      },
      child: Container(
        padding: EdgeInsets.only(top: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            item ? Icon(Icons.add_circle,  size: 45,) : Icon(Icons.add_circle, size: 45, color: AppColors.PRIMARY),
          ],
        ),
      ),
    );
  }
}

class AddProductItem extends StatelessWidget {
  const AddProductItem({Key? key,
    required this.icon, required this.route, required this.title, this.isAuth = true }) : super(key: key);
  final IconData icon;
  final String route;
  final String title;
  final bool isAuth ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(isAuth){
          Provider.of<AuthProvider>(context, listen: false).isLoggedIn() ? AppRoutes.goTo(context, route) : AppHelper.showInfoFlushBar(context, 'Vous devez vous connecter pour accéder à cette fonctionnalité');
        }else{
          AppRoutes.goTo(context, route);
        }
      },
      child: Container(
          child:  Row(
            children: [
              ClipOval(
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: AppColors.PRIMARY,
                  child: Icon(icon, size: 28, color: AppColors.WHITE),
                ),
              ),
              SizedBox(width: 15,),
              Text(title, style: TextStyle(fontSize: 16), )
            ],
          )
      ),
    );
  }
}



