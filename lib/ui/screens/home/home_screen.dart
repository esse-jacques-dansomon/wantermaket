import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/ui/screens/boutique/secteur_screen.dart';
import '../../../route/routes.dart';
import '../../basewidgets/boutique_card.dart';
import '../../basewidgets/category_card.dart';
import '../../basewidgets/deal_du_jour_card.dart';
import '../../basewidgets/produit_by_boutique.dart';

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
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //sliders
              SizedBox(
                height: 130,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return  Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
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
                        itemBuilder: (BuildContext context, int index) => CategoryCard(id : index),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1.4,
                        ),
                      ),
                    ),
                  ),
                ],
              ),


              //Deal du jour
              const TitleAndMoreText( title: 'Deal Du Jours', moreText: 'Voir tous', widget:  SecteurScreen()),
              SizedBox(
                height: 500,
                child: ListView.builder(
                  itemCount: 8,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) => DealDuJour(id: index),
                ),
              ),

              //Top Boutiques
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleAndMoreText( title: 'Meilleurs Vendeurs', moreText: 'Voir tous', widget:  SecteurScreen()),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: SizedBox(
                      height: 145,
                      child: ListView.builder(
                        itemCount: 8,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) => BoutiqueCard(id : index),
                      ),
                    ),
                  ),
                ],
              ),


              //Top annonces
              Container(
                height: 450,
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitleAndMoreText( title: 'Top Annonces', moreText: 'Voir tous', widget:  SecteurScreen()),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 8,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) => ProductByBoutique(id : index),
                      ),
                    ),
                  ],
                ),
              ),


              //banner text
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Container(
                  height: 100,
                  color: AppColors.PRIMARY,
                  child: const Center(
                    child: Text("Avec Wanter Market, retrouvez tous vos produits "
                        "dans différentes catégories et contactez directement le vendeur",
                      style: TextStyle(color: Colors.white, fontSize: 20),textAlign: TextAlign.center, ),
                  ),
                ),
              ),


              //Top Arrivages
              Container(
                height: 450,
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitleAndMoreText( title: 'Arrivages', moreText: 'Voir tous', widget:  SecteurScreen()),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 8,
                        scrollDirection: Axis.horizontal,
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

              //Top annonces
              Container(
                height: 450,
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitleAndMoreText( title: 'Electroniques', moreText: 'Voir tous', widget:  SecteurScreen()),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 8,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) => ProductByBoutique(id : index),
                      ),
                    ),
                  ],
                ),
              ),


              //meilleurs ventes
              Container(
                height: 450,
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitleAndMoreText( title: 'Meilleurs venntes', moreText: 'Voir tous', widget:  SecteurScreen()),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 8,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) => ProductByBoutique(id : index),
                      ),
                    ),
                  ],
                ),
              ),




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
     padding: const EdgeInsets.only(left: 15.0, top: 10,right: 15),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children:  [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18, ), textAlign: TextAlign.start,),
          TextButton(onPressed: (){
            Navigator.pushNamed(context, AppRoutes.category);
          }, child:
         Row(
           children:  [
             Text(moreText, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18, ), textAlign: TextAlign.start,),
             const SizedBox(width: 5,),
             const  Icon(Icons.arrow_forward_ios, size: 15, color: AppColors.SECONDARY,),
           ],
         ),
         ),
       ],
     ),
    );
  }
}

