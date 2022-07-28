import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wantermarket/config/app_colors.dart';

import 'package:wantermarket/data/models/body/boutique.dart';
import 'package:wantermarket/providers/auth_provider.dart';
import 'package:wantermarket/providers/boutique_favories_provider.dart';
import 'package:wantermarket/shared/contact_vendor.dart';

import '../../../config/app_images.dart';
import '../../../providers/boutique_provider.dart';
import '../../../shared/app_helper.dart';
import '../../basewidgets/app_bars/app_bar_with_return.dart';
import '../../basewidgets/produit_by_boutique_3.dart';

class BoutiqueDetailsScreen extends StatefulWidget {
  final Boutique boutique;
  const BoutiqueDetailsScreen({Key? key, required  this.boutique}) : super(key: key);

  @override
  State<BoutiqueDetailsScreen> createState() => _BoutiqueDetailsScreenState();
}

class _BoutiqueDetailsScreenState extends State<BoutiqueDetailsScreen> {

   _loadData() {
    Provider.of<BoutiqueProvider>(context, listen: false).getBoutiqueProduits(widget.boutique.id!);
    //not the connected user views
    if(widget.boutique.id != Provider.of<AuthProvider>(context, listen: false).user.boutiqueId){
      Provider.of<BoutiqueProvider>(context, listen: false).upgradeViewBoutique(widget.boutique.id!);
    }



  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });

  }


   void onShare(BuildContext context) async {
     // A builder is used to retrieve the context immediately
     // surrounding the ElevatedButton.
     //
     // The context's `findRenderObject` returns the first
     // RenderObject in its descendent tree when it's not
     // a RenderObjectWidget. The ElevatedButton's RenderObject
     // has its position and size after it's built.
     final box = context.findRenderObject() as RenderBox?;

       await Share.share('exemple de titre',
           subject: 'link boutique',
           sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);

   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:appBarWithReturn(title: widget.boutique.name!, context: context),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //seller informations
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    image:  DecorationImage(
                      image: NetworkImage(
                        widget.boutique.coverImage!
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Card(
                  child: SizedBox(
                    height: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(width: 15,),
                        ClipOval(
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image:  DecorationImage(
                                image: NetworkImage(
                                  widget.boutique.profilImage ?? AppImage.logo,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(widget.boutique.name!, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                            const SizedBox(height: 5,),
                            Row(
                              children:  [
                                const Icon(Icons.location_on, size: 18,color: AppColors.SECONDARY,),
                                const SizedBox(width: 5,),
                                Text('${widget.boutique.vendor!.city!}  ${widget.boutique.vendor!.country!}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children: const [
                                Icon(Icons.category, size: 18,color : AppColors.SECONDARY),
                                SizedBox(width: 5,),
                                Text('Prêtes à porter', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children:  [
                                const Icon(Icons.shop_two_rounded, size: 18,color: AppColors.SECONDARY,),
                                const SizedBox(width: 5,),
                                Consumer<BoutiqueProvider>(builder: (ctx, boutiqueProvider, child){
                                  return Text('${boutiqueProvider.boutiqueProduits.length} produits', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),);
                                }, ),
                              ],
                            ),
                            //follow button
                            const SizedBox(height: 5,),
                          ],
                        )),
                        const SizedBox(width: 5),
                      ],
                    ),
                  ),
                ),
                //buttons
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Provider.of<AuthProvider>(context, listen: false).getUserConnectedInfo()?.boutiqueId != widget.boutique.id ?
                   Expanded(
                     flex: 4,
                     child: Consumer<BoutiqueFavoriesProvider>(
                       builder: (context, boutiqueFovoriesProvider, _){
                         return ElevatedButton(
                           onPressed: () {
                             if(Provider.of<AuthProvider>(context, listen: false).isLoggedIn()){
                               boutiqueFovoriesProvider.isFavory(widget.boutique.id!) ?
                               boutiqueFovoriesProvider.removeFavory(widget.boutique.id!) :
                               boutiqueFovoriesProvider.addFavory(widget.boutique.id!);
                             }else{
                                AppHelper.showInfoFlushBar(context, 'Vous devez être connecté pour effectuer cette action');
                             }

                           },
                           style: ButtonStyle(
                               backgroundColor: MaterialStateProperty.all(AppColors.PRIMARY)
                           ),
                           child:  Text(boutiqueFovoriesProvider.isFavory(widget.boutique.id!) ? 'Ne Plus Suivre' : "Suivre" , style: const TextStyle(color: Colors.white, fontSize: 15),),
                         );
                       },
                     ),
                   ) : Container() ,
                   const SizedBox(width: 10,),
                   Expanded(
                     flex: 3,
                     child: ElevatedButton(
                       onPressed: () {
                         showModalBottomSheet(
                           constraints:  BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.5),
                           isScrollControlled: true,
                             context: context, builder: (context) =>  FicheVendeur(boutique: widget.boutique,));
                       },
                       style: ButtonStyle(
                           backgroundColor: MaterialStateProperty.all(AppColors.PRIMARY)
                       ),
                       child: const Text('Infos', style: TextStyle(color: Colors.white, fontSize: 15),),
                     ),
                   ),
                   const SizedBox(width: 10,),
                   Expanded(
                     flex: 2,
                     child: ElevatedButton(
                       onPressed: () async {
                           ContactVendor.shareShop();
                         },
                       style: ButtonStyle(
                           backgroundColor: MaterialStateProperty.all(AppColors.WHITE)
                       ),
                       child: const Icon(Icons.share, color: AppColors.PRIMARY,),
                     ),
                   ),
                 ],
                ),
                const SizedBox(height: 15,),
                //search input  + button
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[200],

                  ),
                  child: Row(
                    children:  [
                      const SizedBox(width: 15,),
                      Expanded(child: TextField(
                        onChanged: (value){
                          Provider.of<BoutiqueProvider>(context, listen: false).searchProduct(value);
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Rechercher',
                          hintStyle: TextStyle(color: Colors.black),
                        ),
                      ),),
                      const SizedBox(width: 15,),
                      Icon(Icons.search, size: 25, color: Colors.black,),
                      const SizedBox(width: 15,),
                    ],
                  ),
                ),

                //seller products
                const SizedBox(height: 15,),
                const Text('Produits', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                Consumer<BoutiqueProvider>(builder: (context, boutiqueProvider, child){
                  return GridView.builder(
                      itemCount: boutiqueProvider.productsSearch.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: AppHelper.getCrossAxisCount(context, width: 230),
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 5,
                          mainAxisExtent: 320,
                          childAspectRatio: 1.5
                      ),
                      itemBuilder: (context, index){
                        return SizedBox(width: 230, child: ProductByBoutique3(product: boutiqueProvider.productsSearch[index],));
                      });
                }),
                const SizedBox(height: 25,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FicheVendeur extends StatelessWidget {
  final Boutique boutique;

  const FicheVendeur({
    Key? key, required this.boutique,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height*0.7,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(boutique.name!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                InkWell(child: const Icon(Icons.close, size: 28, color: AppColors.SECONDARY,),
                  onTap: (){
                    Navigator.pop(context);
                  },),
              ],
            ),
            const SizedBox(height: 10,),
            const Text('Biographie', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            Text(boutique.bio!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
            const SizedBox(height: 10,),
            //Nom vendeur
            boutique.vendor?.name != '' ?
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Nom vendeur', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                const SizedBox(height: 5,),
                Text(boutique.vendor!.name!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                const SizedBox(height: 10,),
              ],
            ): Container(),

            //corrdonnees
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Coordonnees', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                const SizedBox(height: 5,),
                Row(
                  children:  [
                    const Icon(Icons.phone, size: 18,),
                    const SizedBox(width: 5,),
                    Text(boutique.vendor!.phone!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                  ],
                ),         const SizedBox(height: 5,),
                InkWell(
                  onTap: (){
                    ContactVendor.lauchWhastapp(boutique.vendor!.phone!, context);
                  },
                  child: Row(
                    children:  [
                      const Icon(Icons.whatsapp, size: 18,),
                      const SizedBox(width: 5,),
                      Text(boutique.vendor!.phone!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                    ],
                  ),
                ),
                const SizedBox(height: 5,),
                Row(
                  children:  [
                    const Icon(Icons.email, size: 18,),
                    const SizedBox(width: 5,),
                    Text(boutique.vendor!.email!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                  ],
                ),
              ],
            ),


            //onpen location in maps
            const SizedBox(height: 15,),
            ElevatedButton(onPressed: (){
              ContactVendor.launchMaps(boutique);
            }, child:Text('Localisation') )

          ],
        ),
      ),
    );
  }
}
