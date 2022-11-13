import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/config/app_images.dart';
import 'package:wantermarket/providers/vendor_provider.dart';
import 'package:wantermarket/route/routes.dart';
import '../../../../shared/contact_vendor.dart';


import 'stats_item.dart';

class VendorDashboardStats extends StatelessWidget {
  const VendorDashboardStats({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      decoration: BoxDecoration(
        color: AppColors.WHITE,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: AppColors.BLACK.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(
          color: AppColors.PRIMARY.withOpacity(0.1),
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 75,
                height:75,
                child: ClipOval(
                    child: Consumer<VendorProvider>(
                      builder: (context, vendorProvider, _)=>CachedNetworkImage(
                        imageUrl: vendorProvider.boutique.profilImage ?? AppImage.logo,
                        fit: BoxFit.cover,
                        width: 75,
                        height: 75,
                      ),
                    )
                ),
              ),
              Consumer<VendorProvider>(
                builder: (context, vendorProvider, _){
                  return  Container(
                    margin: const EdgeInsets.only(left: 15),
                    child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:  [
                        Text(vendorProvider.boutique.name ?? 'Pas encore de nom',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text( "${vendorProvider.boutique.vendor?.city?? ''} " + " ${vendorProvider.boutique.vendor?.country?? ''}",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(height: 5),

                        Text(vendorProvider.boutique.vendor?.address ?? 'Pas encore d\'adresse',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
          Column(
            children: [

              const SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(child: ElevatedButton(onPressed: (){
                    AppRoutes.goTo(context, AppRoutes.editProfile);
                  }, child: const Text('Editer Profil'))),
                  const SizedBox(width: 10,),
                  Expanded(child: ElevatedButton(onPressed: (){
                    AppRoutes.goTo(context, AppRoutes.editBoutiqueBySecteur);
                  }, child: const Text('Editer Boutique'))),
                  const SizedBox(width: 10,),
                  ElevatedButton(onPressed: (){
                    ContactVendor.shareShop(
                        Provider.of<VendorProvider>(context, listen: false).boutique,
                    );
                  }, child: Icon(Icons.share)),
                ],
              ),
              // STATISTIQUES
              Consumer<VendorProvider>(
                builder: (context, vendorProvider, _){
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        decoration: BoxDecoration(
                          color: AppColors.WHITE,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.BLACK.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          border: Border.all(
                            color: AppColors.PRIMARY.withOpacity(0.1),
                            width: 2,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded( flex: 2, child:  StatItem(name: 'Abonnés',value: vendorProvider.vendorStat.nombreAbonnes ?? 0,),),
                            Container(
                              width: 2,
                              height: 45,
                              margin: const EdgeInsets.symmetric(horizontal: 0),
                              color: AppColors.PRIMARY,
                            ),
                            Expanded(flex: 2, child:  StatItem(name: 'Visites',value: vendorProvider.vendorStat.nombreVisites?? 0,)),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.WHITE,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.BLACK.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          border: Border.all(
                            color: AppColors.PRIMARY.withOpacity(0.1),
                            width: 2,
                          ),
                        ),
                        margin: const EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(child:  StatItem(name: 'Produits',value: vendorProvider.vendorStat.produitsTotal??0,)),
                            Container(
                              width: 2,
                              height: 45,
                              margin: const EdgeInsets.symmetric(horizontal: 0),
                              color: AppColors.PRIMARY,
                            ),
                            Expanded(child:  StatItem(name: 'Produits Restants',value: vendorProvider.vendorStat.produitsRestant??0,)),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.WHITE,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.BLACK.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          border: Border.all(
                            color: AppColors.PRIMARY.withOpacity(0.1),
                            width: 2,
                          ),
                        ),
                        margin: const EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(child:  StatItem(name: 'Nombre de boosts réstants',value: vendorProvider.vendorStat.nbreBoostRestant??0,)),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 25,),
            ],
          ),
        ],
      ),
    );
  }
}
