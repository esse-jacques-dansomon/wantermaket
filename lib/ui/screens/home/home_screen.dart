import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/boutique_card.dart';
import '../../widgets/deal_du_jour_card.dart';
import '../../widgets/produit_by_boutique.dart';

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
    return Scaffold(
      appBar: appBar(),
      drawer: newDrawer(MediaQuery.of(context).size.height),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return  Image.network(
                    'https://picsum.photos/250?image=${index*10}',
                    fit: BoxFit.cover,
                  );
                },
                indicatorLayout: PageIndicatorLayout.COLOR,
                autoplay: true,
                duration: 500,
                itemCount: images.length,
                pagination: const SwiperPagination(),
                control: const SwiperControl(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0, top: 10, bottom: 10),
              child: Text('Boutiques Exclusives', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20, ), textAlign: TextAlign.start,),
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                itemCount: 8,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) => BoutiqueCard(id : index),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0, top: 10, bottom: 10),
              child: Text('Deals Du Jour', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20, ), textAlign: TextAlign.start,),
            ),
            SizedBox(
              height: 500,
              child: ListView.builder(
                itemCount: 8,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) => DealDuJour(id: index),
              ),
            ),
            Container(
              height: 600,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 10, bottom: 10),
                    child: Text('Top Annonces', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20, ), textAlign: TextAlign.start,),
                  ),
                  SizedBox(
                    height: 550,
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

    );
  }
}

