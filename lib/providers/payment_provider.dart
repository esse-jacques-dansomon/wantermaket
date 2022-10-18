import 'package:flutter/material.dart';
import 'package:wantermarket/data/models/body/product.dart';

import '../data/models/body/plan.dart';
import '../data/repositories/payment_repo.dart';
import '../shared/api_checker.dart';


enum PaymentLinkStatus {
  initial,
  loading,
  loaded,
  error

}
enum PaymentStatus {
  initial,
  loading,
  pending,
  error

}
enum BoosterPaymentLinkStatus {
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
  PaymentStatus paymentStatus = PaymentStatus.initial;
  BoosterPaymentLinkStatus boosterPaymentLinkStatus = BoosterPaymentLinkStatus.loaded;
  var paymentLinkStatus = PaymentLinkStatus.initial;
  PaymentProvider({ required this.paymentRepo });

  Future<String> getBecameExclusiveLink(BuildContext context) async {
    paymentLinkStatus = PaymentLinkStatus.loading;
    notifyListeners();
    final response = await paymentRepo.getBecameExclusiveLink();
    if (response.error == null) {
      paymentLinkStatus = PaymentLinkStatus.loaded;
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
      return response.response.data['url'];
    } else {
      paymentPlanType = PaymentPlanType.error;
      notifyListeners();
      ApiChecker.checkApi(context, response);
      return '';
    }
  }

  Future<String> getBoosterProductLink(BuildContext context, Product product) async {
    boosterPaymentLinkStatus = BoosterPaymentLinkStatus.loading;
    notifyListeners();
    final response = await paymentRepo.getBoosterProductLink(product);
    if (response.error == null) {
      boosterPaymentLinkStatus = BoosterPaymentLinkStatus.loaded;
      notifyListeners();
      return response.response.data['url'];
    } else {
      boosterPaymentLinkStatus = BoosterPaymentLinkStatus.error;
      notifyListeners();
      ApiChecker.checkApi(context, response);
      return '';
    }
  }

  Future<bool> getStatusPayment(BuildContext context) async{
    paymentStatus = PaymentStatus.loading;
    notifyListeners();
    final response = await paymentRepo.getStatusPayment();
    if (response.error == null) {
      paymentStatus = PaymentStatus.pending;
      notifyListeners();
      return response.response.data['isPaid'];
    } else {
      paymentStatus = PaymentStatus.error;
      ApiChecker.checkApi(context, response);
      return false;
    }
  }

}