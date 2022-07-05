import 'package:flutter/material.dart';
import 'package:wantermarket/route/routes.dart';

import '../../../config/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final bool add_product;
  final bool boutique;
  final bool home;
  final bool profile;
  final bool search;

  const CustomBottomNavBar(
      {Key? key,
        this.add_product = false,
        this.boutique = false,
        this.home = false,
        this.profile = false,
        this.search = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBottomBarItem(
                    activeImage:Icons.home,
                    image:Icons.home_outlined,
                    title: 'Accueil',
                    route: AppRoutes.home,
                    item: home,
                  ),
                  CustomBottomBarItem(
                    activeImage:Icons.shop,
                    image:Icons.shop_outlined,
                    title: 'Boutiques',
                    route: AppRoutes.shop,
                    item: boutique,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CustomBottomBarItem(
                    activeImage:Icons.search,
                    image:Icons.search_outlined,
                    title: 'Recherche',
                    route: AppRoutes.search,
                    item: search ,
                  ),
                  CustomBottomBarItem(
                    activeImage:Icons.person,
                    image:Icons.person_outlined,
                    title: 'Profile',
                    route: AppRoutes.profile,
                    item: profile,
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
  }) : super(key: key);

  final bool item;
  final String route;
  final String title;
  final IconData image;
  final IconData activeImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!item) {
          Navigator.pushNamed(context, route);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          item ? Icon(activeImage, color: AppColors.PRIMARY, size: 28,) : Icon(image),
          item
              ? Text(title, style: const TextStyle(color: AppColors.PRIMARY, fontWeight: FontWeight.bold))
              : Text(title),
        ],
      ),
    );
  }
}

class CustomBottomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.3, 0);
    path.quadraticBezierTo(
      size.width * 0.375,
      0,
      size.width * 0.375,
      size.height * 0.1,
    );
    path.cubicTo(
      size.width * 0.4,
      size.height * 0.9,
      size.width * 0.6,
      size.height * 0.9,
      size.width * 0.625,
      size.height * 0.1,
    );
    path.quadraticBezierTo(
      size.width * 0.625,
      0,
      size.width * 0.7,
      0.1,
    );
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}