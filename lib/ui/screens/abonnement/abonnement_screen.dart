import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/providers/plan_provider.dart';
import 'package:wantermarket/ui/screens/abonnement/widgets/plan_item_widget.dart';

import 'package:wantermarket/ui/basewidgets/app_bars/app_bar_with_return.dart';

class AbonnementScreen extends StatefulWidget {
  const AbonnementScreen({Key? key}) : super(key: key);

  @override
  State<AbonnementScreen> createState() => _AbonnementScreenState();
}

class _AbonnementScreenState extends State<AbonnementScreen> {
  Future<void> _loadData() async {
    Provider.of<PlanProvider>(context, listen: false).getAllPlans(context);
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

