import 'package:flutter/cupertino.dart';
import '../data/models/body/plan.dart';
import '../data/repositories/plan_repo.dart';

class PlanProvider extends ChangeNotifier {
  final PlanRepo planRepo;
  PlanProvider({required this.planRepo});

  final List<Plan> _plans = [];
   List<Plan> get plans => _plans;

    Future<void> getAllPlans() async {
      _plans.clear();
      try{
        final response = await planRepo.getAllPlans();
        if(response.error == null){
          response.response.data['data'].forEach((element) {
            plans.add(Plan.fromJson(element));
          });
          notifyListeners();
        }
      }
      catch(e) {
        print(e);
      }
    }

}