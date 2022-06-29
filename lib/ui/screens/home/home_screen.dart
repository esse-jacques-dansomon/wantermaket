import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/ui/basewidgets/app_bars/drawer.dart';
import 'package:wantermarket/ui/basewidgets/category_card_square.dart';
import 'package:wantermarket/ui/screens/boutique/secteur_screen.dart';

import '../../../route/routes.dart';
import '../../basewidgets/app_bars/app_bar.dart';
import '../../basewidgets/bottom_bar/bottom_nav_bar.dart';
import '../../basewidgets/boutique_card.dart';
import '../../basewidgets/category_card.dart';
import '../../basewidgets/deal_du_jour_card.dart';
import '../../basewidgets/produit_by_boutique.dart';
import '../../basewidgets/produit_by_boutique_2.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final images=[
    'assets/images/agroalimentaire.png',
    'assets/images/logo.png',
  ];
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const CustomBottomNavBar(home: true,),
        appBar: appBar(isActiveSearchbar:true),
        drawer: AppDrawer(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              SizedBox(
                height: 200,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return  Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        image: DecorationImage(
                            image:  Image.network('https://picsum.photos/250?image=${index*10}',).image,  fit: BoxFit.cover),
                      ),

                    );
                  },
                  indicatorLayout: PageIndicatorLayout.COLOR,
                  autoplay: true,
                  duration: 1000,
                  itemCount: images.length,
                  pagination: const SwiperPagination(),

                ),
              ),


              //Boutiques Exlusives
              SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const TitleAndMoreText( title: 'Boutique Exlusives', moreText: 'Voir tous', widget:  SecteurScreen()),
                  Container(
                    height: 155,
                    margin: const EdgeInsets.only(left: 15),
                    child: ListView.separated(
                      itemCount: 8,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (BuildContext context, int index) => SizedBox(width: 5,),
                      itemBuilder: (BuildContext context, int index) => BoutiqueCard(id : index),
                    ),
                  ),
                ],
              ),


              //Categories
              const TitleAndMoreText( title: 'Categories', moreText: 'Voir Plus', widget:  SecteurScreen()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: SizedBox(
                      height: 105,
                      child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 15),
                        itemBuilder: (BuildContext context, int index) => CategoryCard(id : index),
                        itemCount: 8, scrollDirection: Axis.horizontal,),
                    ),
                  ),
                ],
              ),


              //Top annonces
              Container(
                height: 470,
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitleAndMoreText( title: 'Top Annonces', moreText: 'Voir Plus', widget:  SecteurScreen()),
                    Expanded(
                      child: ListView.separated(
                        itemCount: 8,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 10),
                        itemBuilder: (BuildContext context, int index) => ProductByBoutique(id : index),
                      ),
                    ),
                  ],
                ),
              ),


              //banner image
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 15, right: 15),
                child: Container(
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image:  Image.network('https://wantermarket.sn/views/assets/images/slider/home_back0m.webp',).image,  fit: BoxFit.cover),
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
              const TitleAndMoreText( title: 'Deal Du Jours', moreText: 'Voir Plus', widget:  SecteurScreen()),
              SizedBox(
                height: 510,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          width: MediaQuery.of(context).size.width-20,
                          // padding: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            border : Border.all(color: AppColors.SECONDARY, width: 2),
                           ),
                          child: SizedBox(height: 500, child: DealDuJour(id: index)),

                        ),
                        // SizedBox(height: 20,),
                      ],
                    );
                  },
                  indicatorLayout: PageIndicatorLayout.COLOR,
                  autoplay: true,
                  duration: 1000,
                  itemCount: 10,
                  // pagination: const SwiperPagination(),

                ),
              ),
              // Container(
              //   margin: EdgeInsets.only(left: 10),
              //   height: 500,
              //   child: ListView.separated(
              //     itemCount: 8,
              //     scrollDirection: Axis.horizontal,
              //     separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 5),
              //     itemBuilder: (BuildContext context, int index) => DealDuJour(id: index),
              //   ),
              // ),




              //top Categories
              const TitleAndMoreText( title: 'Top Categories', moreText: 'Voir toutes', widget:  SecteurScreen()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: SizedBox(
                      height: 240,
                      child: GridView.builder(
                        itemCount: 14,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) => CategoryCardSquare(id : index),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),


              //banner image
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 15, right: 15),
                child: Container(
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image:  Image.network('https://wantermarket.sn/views/assets/images/slider/home_back0m.webp',).image,  fit: BoxFit.cover),
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
              const TitleAndMoreText( title: 'Nouveautés', moreText: 'Voir Tous', widget:  SecteurScreen()),
              const SizedBox(height: 10,),
              GridView.builder(
                  itemCount: 20,

                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisSpacing: 10, mainAxisExtent: 330),
                  itemBuilder: (context, index){
                    return ProductByBoutique2(id: index,);
                  }),


              const SizedBox(height: 15,),




            ],
          ),
        ),
      ),
    );
  }
}

class TitleAndMoreText extends StatelessWidget {
  final String moreText;
  final String title;
  final Widget widget;
  const TitleAndMoreText({
    Key? key, required this.widget, required this.moreText, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 25,right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, ), textAlign: TextAlign.start,),
          TextButton(onPressed: (){
            Navigator.pushNamed(context, AppRoutes.category);
          }, child:
          Row(
            children: const [
              Text('Voir Plus', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.FACEBOOK  ), textAlign: TextAlign.start,),
               SizedBox(width: 5,),
                Icon(Icons.arrow_forward_ios, size: 13,  color: AppColors.FACEBOOK,),
            ],
          ),
          ),
        ],
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
            suffixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}


