import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/providers/auth_provider.dart';
import 'package:wantermarket/providers/plan_provider.dart';
import 'package:wantermarket/ui/screens/user-actions-account-status/expire-subscription.dart';

import '../../../data/models/body/plan.dart';
import '../../../providers/payment_provider.dart';
import '../../basewidgets/app_bars/app_bar_with_return.dart';
import '../payment_api/paytech_api_payment_screen.dart';

class AbonnementScreen extends StatefulWidget {
  const AbonnementScreen({Key? key}) : super(key: key);

  @override
  State<AbonnementScreen> createState() => _AbonnementScreenState();
}

class _AbonnementScreenState extends State<AbonnementScreen> {
  Future<void> _loadData() async {
    Provider.of<PlanProvider>(context, listen: false).getAllPlans();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Provider.of<PlanProvider>(context, listen: false).plans.isEmpty){
      _loadData();
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: appBarWithReturn(title: 'Abonnements', context: context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             // const  Text('Mon Abonnement', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15,),
              Expanded(child: Consumer<PlanProvider>(
                builder: (context, planProvider, _){
                  return ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return PlanItem(plan: planProvider.plans[index],);
                      },
                      separatorBuilder: (context, index)
                      => const SizedBox(height: 30),
                      itemCount: planProvider.plans.length

                  );
                }
              ))

            ],
          ),
        ),
      ),
    ));
  }
}

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
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.fromLTRB(25, 25, 15, 25),
                child: Column(
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
              (Provider.of<AuthProvider>(context, listen: false).getUserConnectedInfo() != null
                  && Provider.of<AuthProvider>(context, listen: false).getUserConnectedInfo()?.plan == plan.name!
              ) == false ? Consumer<PaymentProvider>(builder: (context, paymentProvider, child){
                switch(paymentProvider.paymentLinkStatus){
                  case PaymentLinkStatus.initial :
                  case PaymentLinkStatus.loading :
                    return const CircularProgressIndicator();
                  case PaymentLinkStatus.error:
                    return const Text('Erreur');
                  case PaymentLinkStatus.loaded:
                    return Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: AppColors.SECONDARY
                            )
                        ),
                        margin: const EdgeInsets.fromLTRB(25, 0, 25, 25),

                        child: TextButton(

                          onPressed: () async {
                            await  Provider.of<PaymentProvider>(context, listen: false).getAbonnementLink(plan.id!).then((url) async {
                              await (Navigator.push(context, MaterialPageRoute(builder: (context) =>  PayTechApiPaymentScreen( initialUrl : url)),) );
                            });

                          },
                          child:  Text('   Choisir le plan ${plan.name!}  ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                        )
                    );
                }
              },) : Container(),


            ],
          ),
        ),
      ],
    );
  }
}
