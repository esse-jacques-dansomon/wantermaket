import 'package:flutter/material.dart';
import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/config/app_dimenssions.dart';
import 'package:wantermarket/ui/basewidgets/app_bars/drawer.dart';
import 'package:wantermarket/ui/screens/home/widgets/home_categories_widget.dart';
import 'package:wantermarket/ui/screens/home/widgets/boutiques_exclusives_widget.dart';
import 'package:wantermarket/ui/screens/home/widgets/deal_du_jour_widget.dart';
import 'package:wantermarket/ui/screens/home/widgets/home_sliders_widget.dart';
import 'package:wantermarket/ui/screens/home/widgets/nouveautes_widget.dart';
import 'package:wantermarket/ui/screens/home/widgets/top_annonces_widget.dart';
import 'package:wantermarket/ui/screens/home/widgets/top_boutiques_widget.dart';

import '../../basewidgets/app_bars/app_bar.dart';
import '../../basewidgets/bottom_bar/bottom_nav_bar.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const CustomBottomNavBar(home: true,),
        appBar: appBar(isActiveSearchbar:true),
        drawer: const AppDrawer(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              HomeSliders(images: images),
              //Boutiques Exlusives
              const SizedBox(height: 30),
              const BoutiquesExclusives(),

              //Categories
              const HomeCategories(),

              //Top annonces
              const TopAnnoncesWidget(),

              //banner image
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Container(
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    color: AppColors.BLACK,
                    backgroundBlendMode: BlendMode.darken,
                    image: DecorationImage(
                        image:  Image.network('https://picsum.photos/250?image=41',).image,  fit: BoxFit.cover),
                  ),
                  child:  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Placer vos Annonces Ici",
                          style: TextStyle(color: Colors.white, fontSize: 20),textAlign: TextAlign.center, ),
                        Text("+221 77 888 888",
                          style: TextStyle(color: Colors.white, fontSize: 20),textAlign: TextAlign.center, ),
                      ],
                    ),
                  ),
                ),
              ),

              //Deal du jour
              const DealDuJourWidget(),

              //top Boutqiues
              const TopBoutiquesWidget(),

              //banner image
              Padding(
                padding: const EdgeInsets.only(top: 30.0, ),
                child: Container(
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    color: AppColors.BLACK,
                    backgroundBlendMode: BlendMode.darken,
                    image: DecorationImage(
                        image:  Image.network('https://picsum.photos/250?image=41',).image,  fit: BoxFit.cover),
                  ),
                  child:  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Placer vos Annonces Ici",
                          style: TextStyle(color: Colors.white, fontSize: 20),textAlign: TextAlign.center, ),
                        Text("+221 77 888 888",
                          style: TextStyle(color: Colors.white, fontSize: 20),textAlign: TextAlign.center, ),
                      ],
                    ),
                  ),
                ),
              ),

              // Nouveautes
              const NouveautesWidget(),
              //load more
              const SizedBox(height: 10),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Plus d'articles", style: TextStyle(color: AppColors.SECONDARY, fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE),),
                ),
              ),
              const SizedBox(height: 30),

            ],
          ),
        ),
      ),
    );
  }
}






class SearchFormWidget extends StatelessWidget {
  const SearchFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: AppColors.WHITE,
      height: 100,
      child: Container(
        height: 40,
        //shadow box
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        margin: const EdgeInsets.symmetric(vertical: 0.0),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),

            ),
            hintText: 'Rechercher',
            suffixIcon: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}


