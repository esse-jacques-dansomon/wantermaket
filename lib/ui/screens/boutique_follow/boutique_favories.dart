import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/config/app_dimenssions.dart';
import 'package:wantermarket/config/app_images.dart';
import 'package:wantermarket/data/models/body/boutique.dart';
import 'package:wantermarket/providers/boutique_favories_provider.dart';
import 'package:wantermarket/route/routes.dart';

import '../../basewidgets/app_bars/app_bar_with_return.dart';

class BoutiquesFavoriesScreen extends StatefulWidget {
  const BoutiquesFavoriesScreen({Key? key}) : super(key: key);

  @override
  State<BoutiquesFavoriesScreen> createState() => _BoutiquesFavoriesScreenState();
}

class _BoutiquesFavoriesScreenState extends State<BoutiquesFavoriesScreen> {

  _loadBoutiquesFavories() async {
    final boutiqueFavoriesProvider = Provider.of<BoutiqueFavoriesProvider>(context, listen: false);
    boutiqueFavoriesProvider.getAllMyFavories();
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadBoutiquesFavories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithReturn(title: 'Mes Boutiques Favories', context: context),
      body: SafeArea(
        child: Provider.of<BoutiqueFavoriesProvider>(context, listen: true).boutiquesFavories.isNotEmpty ? Padding(
          padding : const EdgeInsets.only(left: 15.0, right: 15.0, top: 10),
          child: Consumer<BoutiqueFavoriesProvider>(
            builder: (context, boutiqueFavoriesProvider, _){
              return ListView.separated(
                shrinkWrap: true,
                itemCount: boutiqueFavoriesProvider.boutiquesFavories.length,
                itemBuilder: (context, index){
                  return BoutiqueFavorie( boutique: boutiqueFavoriesProvider.boutiquesFavories[index],);
                },
                separatorBuilder: (context, index){
                  return const Divider(
                    height: 1,
                    color: Colors.grey,
                  );

                },
              );
            }
          ),
        ) : const Center(
          child: Text('Vous n\'avez pas de boutique favories'),
        ),
      ),
    );
  }
}

class BoutiqueFavorie extends StatelessWidget {
  final Boutique boutique;
  const BoutiqueFavorie({
    Key? key, required this.boutique,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, AppRoutes.vendor, arguments: boutique);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        height: 110,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipOval(
                  child: SizedBox(
                    width: 55,
                    height: 55,
                    child: Image.network(
                      boutique.profilImage ?? AppImage.logo,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(boutique.name!, style: const TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 5,),
                    SizedBox(width: MediaQuery.of(context).size.width-100, child: Text(boutique.vendor!.address!, overflow: TextOverflow.ellipsis, style: const TextStyle( fontSize: AppDimensions.FONT_SIZE_DEFAULT, ), maxLines: 2,  )),
                  ],
                ),
                Expanded(child: Container()),
                //follow button

              ],
            ),
            const SizedBox(height: 10,),
            Container(
              margin: const
              EdgeInsets.only(left: 70),
              height: 35,
              width: 105,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.red,
              ),
              child: Center(
                child: TextButton(
                  // style: ButtonStyle(
                  //   backgroundColor: MaterialStateProperty.all(Colors.red),
                  // ),
                  onPressed: (){
                    Provider.of<BoutiqueFavoriesProvider>(context, listen: false).removeFavory(boutique.id!);
                  },
                  child: const Text('Enlever', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_DEFAULT, color: Colors.white),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
