import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/config/app_images.dart';
import 'package:wantermarket/providers/auth_provider.dart';
import 'package:wantermarket/providers/boutique_favories_provider.dart';
import 'package:wantermarket/route/routes.dart';
import 'package:wantermarket/shared/app_helper.dart';
import 'package:wantermarket/ui/screens/boutique_details/widgets/signal_vendor.dart';

import '../../../../config/app_colors.dart';
import '../../../../data/models/body/boutique.dart';
import '../../../../providers/boutique_provider.dart';
import '../../../../shared/contact_vendor.dart';
import '../../../basewidgets/cards/fiche_vendor_card.dart';

class VendorInformationWidget extends StatelessWidget {
  final Boutique boutique;
  const VendorInformationWidget({
    Key? key,
    required this.boutique,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            image:  DecorationImage(
              image: CachedNetworkImageProvider(
                  boutique.coverImage!
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
                        image: CachedNetworkImageProvider(
                          boutique.profilImage ?? AppImage.logo,
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
                    Text(boutique.name!, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),),
                    const SizedBox(height: 5,),
                    Row(
                      children:  [
                        const Icon(Icons.location_on, size: 18,color: AppColors.SECONDARY,),
                        const SizedBox(width: 5),
                        Text('${boutique.vendor?.city?? 'Ville'}  ${boutique.vendor?.country ?? ' Pays'}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                      ],
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      children:  [
                        Icon(Icons.category, size: 18,color : AppColors.SECONDARY),
                        SizedBox(width: 5,),
                        Text(boutique.secteurs!.length > 0 ?
                        boutique.secteurs![0].name ?? 'Aucun Secteur'
                            :"Aucun Secteur"  , style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                        Text(' ... ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                      ],
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      children:  [
                        const Icon(Icons.shop_two_rounded, size: 18,color: AppColors.SECONDARY,),
                        const SizedBox(width: 5,),
                        Consumer<BoutiqueProvider>(builder: (ctx, boutiqueProvider, child){
                          return Text('${boutiqueProvider.totalBoutiqueProducts} produits', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),);
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
            Provider.of<AuthProvider>(context, listen: false).getUserConnectedInfo()?.boutiqueId != boutique.id ?
            Expanded(
              flex: 4,
              child: Consumer<BoutiqueFavoriesProvider>(
                builder: (context, boutiqueFovoriesProvider, _){
                  return ElevatedButton(
                    onPressed: () {
                      if(Provider.of<AuthProvider>(context, listen: false).isLoggedIn()){
                        boutiqueFovoriesProvider.isFavory(boutique.id!) ?
                        boutiqueFovoriesProvider.removeFavory(boutique.id!, context) :
                        boutiqueFovoriesProvider.addFavory(boutique.id!, context);
                      }else{
                        Navigator.of(context).pushNamed(AppRoutes.login);
                        AppHelper.showInfoFlushBar(context, 'Vous devez être connecté pour effectuer cette action');
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(AppColors.PRIMARY)
                    ),
                    child:  Text(boutiqueFovoriesProvider.isFavory(boutique.id!) ? 'Ne Plus Suivre' : "Suivre" , style: const TextStyle(color: Colors.white, fontSize: 15),),
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
                      constraints:  BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.7),
                      isScrollControlled: true,
                      context: context, builder: (context) =>  FicheVendeur(boutique: boutique,));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColors.PRIMARY)
                ),
                child: const Text('Infos', style: TextStyle(color: Colors.white, fontSize: 15),),
              ),
            ),
            const SizedBox(width: 10,),
            Expanded(
              flex: 1,
              child: Center(
                child: InkWell(
                  onTap: () async {
                    // ContactVendor.shareShop(boutique);
                    //show showModalBottomSheet
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
                            padding: const EdgeInsets.only(top: 5, bottom: 10),
                            margin: const EdgeInsets.only(  left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 15,),
                                ListTile(
                                  onTap: () async {
                                    Navigator.of(context).pop();
                                     ContactVendor.shareShop(boutique);
                                  },
                                  horizontalTitleGap: 0,
                                  leading: const Icon(Icons.share_sharp, color: AppColors.PRIMARY,),
                                  title: const Text('Partager', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                                ),
                                ListTile(
                                  onTap: () async {
                                    Navigator.of(context).pop();
                                    showModalBottomSheet(
                                        backgroundColor: Colors.transparent,
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) {
                                          return SignalerVendorBottomSheetModal(vendorId: boutique.vendor!.id!.toInt());
                                        }
                                    );
                                  },
                                  horizontalTitleGap: 0,
                                  leading: const Icon(Icons.flag, color: AppColors.PRIMARY,),
                                  title: const Text('Signaler la boutique', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                                ),
                                ListTile(
                                  onTap: () async {
                                    Navigator.of(context).pop();
                                    ContactVendor.shareShop(boutique);
                                  },
                                  horizontalTitleGap: 0,
                                  leading: const Icon(Icons.block, color: AppColors.PRIMARY,),
                                  title: const Text('Bloquer cette boutique', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                                ),


                              ],
                            ),
                          );
                        });


                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.WHITE ,
                    ),
                      child: const Icon(Icons.more_vert, color: AppColors.PRIMARY,)),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15,),
      ],
    );
  }
}
