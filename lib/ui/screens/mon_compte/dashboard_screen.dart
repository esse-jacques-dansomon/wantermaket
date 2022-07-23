

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/config/app_images.dart';
import 'package:wantermarket/providers/vendor_provider.dart';
import 'package:wantermarket/route/routes.dart';
import 'package:wantermarket/shared/app_helper.dart';
import 'package:wantermarket/ui/basewidgets/app_bars/drawer.dart';
import 'package:wantermarket/ui/screens/home/home_screen.dart';

import '../../../data/models/body/product.dart';
import '../../../providers/curd_product_provider.dart';
import '../../basewidgets/app_bars/app_bar.dart';
import '../../basewidgets/bottom_bar/bottom_nav_bar.dart';


class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {

  _loadData()  {
    Provider.of<VendorProvider>(context, listen: false).getBoutique();
    Provider.of<VendorProvider>(context, listen: false).getVendorProducts();
  }



  @override
  initState()  {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<VendorProvider>(context, listen: false).getVendorStat();

      if( Provider.of<VendorProvider>(context, listen: false).boutique.vendor?.firstName == null) {
        _loadData();
      }

    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBar(profile: true,),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addProduct);
        },
        backgroundColor: AppColors.PRIMARY,
        child: const Icon(Icons.add, color: AppColors.WHITE, size: 50,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: appBar(isActiveSearchbar: true),
      drawer: const AppDrawer(),
      backgroundColor: AppColors.WHITE,
      body:  Provider.of<VendorProvider>(context, listen: true).isProductsLoad ? SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10) ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
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
                              builder: (context, vendorProvider, _)=>Image.network(
                                vendorProvider.boutique.profilImage!,
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  const Text('Marketing & Communication',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  const SizedBox(height: 5),

                                  Text(vendorProvider.boutique.vendor!.address ?? 'Pas encore d\'adresse',
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
                              Navigator.pushNamed(context, AppRoutes.editProfile);

                            }, child: const Text('Editer Profile'))),
                            const SizedBox(width: 10,),
                            Expanded(child: ElevatedButton(onPressed: (){
                              Navigator.pushNamed(context, AppRoutes.editBoutiqueBySecteur);
                            }, child: const Text('Editer Boutique'))),
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
                                       Expanded(flex: 2, child:  StatItem(name: 'Visites',value: vendorProvider.vendorStat.nombreVisites!,)),
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
                                      Expanded(child:  StatItem(name: 'Produits',value: vendorProvider.vendorStat.produitsTotal!,)),
                                      Container(
                                        width: 2,
                                        height: 45,
                                        margin: const EdgeInsets.symmetric(horizontal: 0),
                                        color: AppColors.PRIMARY,
                                      ),
                                      Expanded(child:  StatItem(name: 'Produits Restants',value: vendorProvider.vendorStat.produitsRestant!,)),
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
              ),


              Container(
                margin : const EdgeInsets.only(bottom: 20, top: 10),
                child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      const Expanded(child:  Divider(color: Colors.grey,),),
                      Container( padding: const EdgeInsets.symmetric(horizontal: 10), child: const Text('Mes Produits', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
                      const Expanded(child: Divider(color: Colors.grey,),),
                    ]
                ),
              ),
              Consumer<VendorProvider>(
                builder: (context, vendorProvider, _){
                  return vendorProvider.products.isNotEmpty ? GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: AppHelper.getCrossAxisCount(context, width: 230),
                          childAspectRatio: 1.5,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 320
                      ),
                      itemCount: vendorProvider.products.length,
                      itemBuilder : (context, index){
                        return VendorProductCard(product: vendorProvider.products[index],);
                      }
                  ) : Container(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                    child: const Center(child: Text('Aucun Produit', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
                  );
                },
              ),
              const SizedBox(height: 50,),
            ],
          ),

        ),
      ) : const LoaderWidget(),
    );
  }
}

class VendorProductCard extends StatelessWidget {
  final Product product;
  const VendorProductCard({
    Key? key, required this.product
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, AppRoutes.product, arguments: product);
      },
      child: Card(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.hardEdge,
              children:  [
                SizedBox(
                  width: double.infinity,
                  height: 180,
                  child: Image.network(
                    product.images!.isNotEmpty ? product.images![0].path : AppImage.logo,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5,),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text(AppHelper.priceFormat(price: "${product.priceBefore != 0 ? product.priceBefore : product.price}"), maxLines: 2, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: AppColors.SECONDARY),),
                      const SizedBox(height: 5,),
                      Text('${product.name}', maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 13),),
                      const SizedBox(height: 5,),
                      Row(
                        children: [
                          Row(
                            children:  [
                              const Icon(Icons.remove_red_eye, color: Colors.grey,),
                              const SizedBox(width: 5,),
                              Text('${product.nombre_vues}'),
                              const SizedBox(width: 5,),
                              const Text('Vues')
                            ],
                          ),

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height:25,
                            child: ElevatedButton(
                                style: const ButtonStyle(

                                ),
                                onPressed: (){
                                  Navigator.pushNamed(context, AppRoutes.addProduct, arguments: product);
                                }, child: const Text('Modifier')),
                          ),
                          //on off button
                          Switch(
                            value: product.disponibility == 'oui'? true : false,
                            onChanged: (value){
                              Provider.of<CrudProductProvider>(context, listen: false).updateDisponibility(product).then((value){
                                if(value){
                                  Provider.of<VendorProvider>(context, listen: false).changeDisponibilityProduct(product.id!, context);
                                  // Provider.of<VendorProvider>(context, listen: false).getVendorProducts();
                                  AppHelper.showInfoFlushBar(context, 'Produit modifié');
                                }else{
                                  AppHelper.showInfoFlushBar(context, 'une erreur s\'est produite ', color: Colors.red);
                                }
                              });
                          },),
                        ],
                      )
                    ],
                  ),
                )),

          ],
        ),
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final String name; final int value;
  const StatItem({
    Key? key,
    required this.name, required this.value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:  [
          Text('$value', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.PRIMARY),),
          const SizedBox(height: 7,),
          Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.PRIMARY),),
        ],
      ),
    );
  }
}
