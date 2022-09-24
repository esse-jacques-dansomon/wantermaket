import 'package:flutter/cupertino.dart';
import '../data/models/body/plan.dart';
import '../data/repositories/plan_repo.dart';
import '../shared/api_checker.dart';

class PlanProvider extends ChangeNotifier {
  final PlanRepo planRepo;
  PlanProvider({required this.planRepo});

  final List<Plan> _plans = [];
   List<Plan> get plans => _plans;

    Future<void> getAllPlans(BuildContext context) async {
      _plans.clear();
      final response = await planRepo.getAllPlans();
      if(response.error == null){
        response.response.data.forEach((element) {
          plans.add(Plan.fromJson(element));
        });
        notifyListeners();
      }else{
        ApiChecker.checkApi(context, response);
      }
    }

}