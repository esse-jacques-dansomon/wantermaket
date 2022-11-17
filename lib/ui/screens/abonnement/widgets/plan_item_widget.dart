import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/data/models/body/plan.dart';
import 'package:wantermarket/providers/auth_provider.dart';
import 'package:wantermarket/providers/payment_provider.dart';
import 'package:wantermarket/route/routes.dart';
import 'package:wantermarket/shared/app_helper.dart';
import 'package:wantermarket/ui/basewidgets/loaders/custom_app_loader.dart';
import 'package:wantermarket/ui/screens/payment_api/paytech_api_payment_screen.dart';

class PlanItem extends StatelessWidget {
  final Plan plan;
  const PlanItem({
    Key? key, required this.plan
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (Provider.of<AuthProvider>(context, listen: false).getUserConnectedInfo() != null
            && Provider.of<AuthProvider>(context, listen: false).getUserConnectedInfo()?.plan == plan.name!
        ) ?
        Container(
          margin: const EdgeInsets.only(left: 40, right: 40),
          color: Colors.green,
          width: double.infinity,
          height: 40,
          child: const Center(child:  Text('Abonnement Actuel', style: TextStyle(fontSize: 20, color: AppColors.WHITE),)),
        ) : Container(),
        Container(
          decoration: BoxDecoration(
              border:  Border.all(
                  color: AppColors.SECONDARY,
                  width: 1
              )
          ),
          child: Column(
            children: [
              Container(
                color: AppColors.SECONDARY,
                width: double.infinity,
                height: 40,
                child: Center(child:  Text(plan.name!, style: const TextStyle(fontSize: 22, color: AppColors.WHITE),)),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 5, top: 15),
                alignment: Alignment.center,
                child: Text("${plan.price == 0 ?'Gratuit' : '${plan.price} / FCFA'}" , style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black),),
              ),
              Divider(color: AppColors.SECONDARY,),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.fromLTRB(25, 10, 15, 25),
                child: plan.name?.toLowerCase()=="ecommerce"?
                Container(
                    padding: const EdgeInsets.only(left: 20, right: 25),
                    child: Text(plan.description ?? "Pas de description",
                      style: const TextStyle(fontSize: 18, color: AppColors.BLACK, fontWeight: FontWeight.bold),))
                    :Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text('* Validité : ${plan.validite} jours', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    Text('* Nombre de produits :  ${plan.nbrProduit}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    const Text('* Catégories : toutes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    plan.name! == "Gold" ? const Text('* Localisation : disponible', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),) : Container(),
                    plan.name! == "Gold" ? const Text('* Publications sur les réseaux sociaux', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),) : Container(),
                    Text('* sidebar : ${plan.sidebar}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    Text('* Deal du jour : ${plan.nbrDeal}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    Text('* Promo banner : ${plan.banner}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              if ((Provider.of<AuthProvider>(context, listen: false).getUserConnectedInfo() != null
                  && Provider.of<AuthProvider>(context, listen: false).getUserConnectedInfo()?.plan == plan.name!
              ) == false) Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: AppColors.SECONDARY
                      )
                  ),
                  margin: const EdgeInsets.fromLTRB(25, 0, 25, 25),
                  child: TextButton(
                    onPressed: () async {
                      Provider.of<AuthProvider>(context, listen: false).isLoggedIn() ?
                      //open dialogue
                      showDialog(
                          context: context, builder: (context) => Container(
                        height: 200,
                        child: AlertDialog(
                          title: const Text('Confirmation de paiement'),
                          content:  Text('Voulez-vous vraiment souscrire à ce plan ' + plan.name! + '?'),
                          actions: [
                            Consumer<PaymentProvider>(builder: (context, paymentProvider, child){
                              switch(paymentProvider.paymentPlanType) {
                                case PaymentPlanType.loading:
                                  return Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(  child: Center(child: const CustomAppLoader()), height: 70,),
                                    ],
                                  );
                                case PaymentPlanType.loaded:
                                  return Row(
                                    children: [
                                      TextButton(
                                        onPressed: () async {
                                          Provider.of<AuthProvider>(context, listen: false).isLoggedIn()?
                                          await  Provider.of<PaymentProvider>(context, listen: false).getAbonnementLink(context, plan).then((url) async
                                          {
                                            await (Navigator.push(context, MaterialPageRoute(builder: (context) =>  PayTechApiPaymentScreen( initialUrl : url)),) );
                                          }) : {
                                            (Navigator.popAndPushNamed(context, AppRoutes.login)),
                                            AppHelper.showInfoFlushBar(context, "Vous devez vous connecter pour continuer")};
                                        },
                                        child:  Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: AppColors.SECONDARY,
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          child: Text('Confirmer', style: TextStyle(color: AppColors.WHITE),),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: AppColors.WHITE,
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          child: Text('Annuler', style: TextStyle(color: AppColors.SECONDARY),),
                                        ),
                                      )
                                    ],
                                  );
                                case PaymentPlanType.error:
                                  return Row(
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: AppColors.SECONDARY,
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          child: Text("Une erreur s'est produite, Réessayer", style: TextStyle(color: AppColors.WHITE),),
                                        ),
                                      )
                                    ],
                                  );
                              }
                            }),
                          ],
                        ),
                      )) :
                      AppHelper.showInfoFlushBar(context, "Vous devez vous connecter pour continuer");
                    },
                    child:  Text('   Choisir le plan ${plan.name!}  ', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  )
              )

              else Container(),

            ],
          ),
        ),
      ],
    );
  }
}
