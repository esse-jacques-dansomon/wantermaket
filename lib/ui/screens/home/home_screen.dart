import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/providers/boutique_provider.dart';
import 'package:wantermarket/providers/product_provider.dart';
import 'package:wantermarket/providers/slider_provider.dart';
import 'package:wantermarket/ui/basewidgets/drawer/drawer.dart';
import 'package:wantermarket/ui/basewidgets/loaders/custom_app_loader.dart';
import 'package:wantermarket/ui/screens/home/widgets/banner_widget.dart';
import 'package:wantermarket/ui/screens/home/widgets/home_categories_widget.dart';
import 'package:wantermarket/ui/screens/home/widgets/boutiques_exclusives_widget.dart';
import 'package:wantermarket/ui/screens/home/widgets/deal_du_jour_widget.dart';
import 'package:wantermarket/ui/screens/home/widgets/home_sliders_widget.dart';
import 'package:wantermarket/ui/screens/home/widgets/nouveautes_widget.dart';
import 'package:wantermarket/ui/screens/home/widgets/top_annonces_widget.dart';
import 'package:wantermarket/ui/screens/home/widgets/top_boutiques_widget.dart';
import '../../../providers/category_provider.dart';
import '../../../providers/signaler_provider.dart';
import '../../basewidgets/app_bars/app_bar.dart';
import '../../basewidgets/bottom_bar/bottom_nav_bar.dart';



class HomeScreen extends StatefulWidget {
  final reload;
  const HomeScreen({Key? key, this.reload=false}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _controller = ScrollController();


  Future<void> _loadDataBoutique() async {
    Provider.of<SliderProvider>(context, listen: false).getHomeSliders(context);
    Provider.of<BoutiqueProvider>(context, listen: false).getBoutiquesExclusives(context);
    Provider.of<BoutiqueProvider>(context, listen: false).getTopBoutiques(context);
    Provider.of<ProductProvider>(context, listen: false).getTopAnnonces(context);
    Provider.of<ProductProvider>(context, listen: false).getDealOfTheDay(context);
    Provider.of<ProductProvider>(context, listen: false).getNewArrivals(context, reload: true);
    Provider.of<SignalerProvider>(context, listen: false).getRaisons(context, "produit");
    Provider.of<SignalerProvider>(context, listen: false).getRaisons(context, "vendeur");
    Provider.of<CategoryProvider>(context, listen: false).getCategories(context);
  }

  //late final FirebaseMessaging _messaging;
 // late Pushnotification? _notificationInfo;
/*
 void registerNotification() async {
    await Firebase.initializeApp();
    _messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      sound: true,
      badge: true,
      provisional: false,
    );
    _messaging.getToken().then((token) => print(token));

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        Pushnotification notification = Pushnotification(
          title: message.notification?.title,
          body: message.notification?.body,
          dataBody: message.data['body'],
          dataTitle: message.data['title'],
        );

        setState(() {
          _notificationInfo = notification;
        });

        showSimpleNotification(
          Text(_notificationInfo?.title ?? 'Notification'),
          leading: const Icon(Icons.notifications),
          background: Colors.red,
          autoDismiss: true,
        );
      });
    }
  }
*/
/*
  checkForInitialMessage() async {
    await Firebase.initializeApp();
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      Pushnotification notification = Pushnotification(
        title: initialMessage.notification?.title,
        body: initialMessage.notification?.body,
        dataBody: initialMessage.data['body'],
        dataTitle: initialMessage.data['title'],
      );
      setState(() {
        _notificationInfo = notification;
      });

      showSimpleNotification(
        Text(_notificationInfo?.title ?? 'Notification'),
        leading: const Icon(Icons.notifications),
        background: Colors.red,
        duration: const Duration(seconds: 5),
        autoDismiss: true,
      );
    }
  }

*/
  @override
  void initState() {
    /*
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _notificationInfo = null;
      registerNotification();
      checkForInitialMessage();
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        Pushnotification notification = Pushnotification(
          title: message.notification?.title,
          body: message.notification?.body,
          dataBody: message.data['body'],
          dataTitle: message.data['title'],
        );
        setState(() {
          _notificationInfo = notification;
        });

        showSimpleNotification(
          Text(_notificationInfo?.title ?? 'Notification'),
          leading: const Icon(Icons.notifications),
          background: AppColors.PRIMARY,
          autoDismiss: true,
        );
      });


    });*/
    super.initState();
    _controller.addListener(_scrollListener);
    // NetworkInfo.checkConnectivity(context);
  }

  void _scrollListener() {
    if (_controller.position.pixels == _controller.position.maxScrollExtent ) {
      Provider.of<ProductProvider>(context, listen: false).getNewArrivals(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar:  CustomBottomNavBar(home: true, scrollController: _controller),
      appBar: appBar(isActiveSearchbar:true),
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: _loadDataBoutique ,
        child: SafeArea(
          child: SingleChildScrollView(
            // physics: const BouncingScrollPhysics(),
            controller: _controller,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const HomeSliders(),
                //Boutiques Exlusives
                const SizedBox(height: 20),
                const BoutiquesExclusives(),

                //Categories
                const HomeCategories(),

                //Top annonces
                const TopAnnoncesWidget(),

                //banner image
                const BannerWidget(),

                //Deal du jour
                const DealDuJourWidget(),

                //top Boutqiues
                const TopBoutiquesWidget(),

                //banner image
                const BannerWidget(),

                // Nouveautes
                const NouveautesWidget(),
                //load more
                const SizedBox(height: 10),

                Provider.of<ProductProvider>(context, listen: true).isPaginationLoading ? const Center(child: CustomAppLoader(),) :  SizedBox(height: 10),

              ],
            ) ,
          ),
        ),
      ),
    ) ;
  }
}

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: Image.asset('assets/images/logo.png', fit:BoxFit.cover,),
            ),
            const SizedBox(height: 30),
            const CustomAppLoader(),

          ],
        ),
      ),
    );
  }
}