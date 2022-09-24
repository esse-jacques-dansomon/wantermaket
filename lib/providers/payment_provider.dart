import 'package:flutter/material.dart';

import '../data/models/body/plan.dart';
import '../data/repositories/payment_repo.dart';
import '../shared/api_checker.dart';


enum PaymentLinkStatus {
  initial,
  loading,
  loaded,
  error

}

enum PaymentPlanType{
  loadingBasic,
  loadingPremium,
  loadingGold,
  loadingEcommerce,
  loaded,
  error,
}
class PaymentProvider extends ChangeNotifier {

  final PaymentRepo paymentRepo;
  PaymentPlanType paymentPlanType = PaymentPlanType.loaded;
  var paymentLinkStatus = PaymentLinkStatus.initial;
  PaymentProvider({ required this.paymentRepo });

  Future<String> getBecameExclusiveLink(BuildContext context) async {
    paymentLinkStatus = PaymentLinkStatus.loading;
    notifyListeners();
    final response = await paymentRepo.getBecameExclusiveLink();
    if (response.error == null) {
      paymentLinkStatus = PaymentLinkStatus.loaded;
      print(response.response.data);
      notifyListeners();
      return response.response.data['url'];
    } else {
      paymentLinkStatus = PaymentLinkStatus.error;
      notifyListeners();
      ApiChecker.checkApi(context, response);
      return '';
    }
  }

  Future<String> getAbonnementLink(BuildContext context, Plan plan) async {
    if(plan.name == 'Gold') {
      paymentPlanType = PaymentPlanType.loadingGold;
    }else if(plan.name == 'Premium') {
      paymentPlanType = PaymentPlanType.loadingPremium;
    }else if(plan.name == 'Ecommerce') {
      paymentPlanType = PaymentPlanType.loadingEcommerce;
    } else {
      paymentPlanType = PaymentPlanType.loadingBasic;
    }
    notifyListeners();
    final response = await paymentRepo.getAbonnementLink(plan.id!);
    if (response.error == null) {

      if(paymentPlanType==PaymentPlanType.loadingEcommerce){
        paymentPlanType = PaymentPlanType.loaded;
        notifyListeners();
        return 'ecom';
      }
      paymentPlanType = PaymentPlanType.loaded;
      notifyListeners();
      paymentPlanType = PaymentPlanType.loaded;
      notifyListeners();
      return response.response.data['url'];
    } else {
      paymentPlanType = PaymentPlanType.error;
      notifyListeners();
      ApiChecker.checkApi(context, response);
      return '';
    }
  }

  Future<bool> getStatusPayment(BuildContext context) async{
    final response = await paymentRepo.getStatusPayment();
    if (response.error == null) {
      return response.response.data['isPaid'];
    } else {
      ApiChecker.checkApi(context, response);
      return false;
    }
  }

}