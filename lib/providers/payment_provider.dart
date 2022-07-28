import 'package:flutter/material.dart';

import '../data/repositories/payment_repo.dart';


enum PaymentLinkStatus {
  initial,
  loading,
  loaded,
  error

}
class PaymentProvider extends ChangeNotifier {

  final PaymentRepo paymentRepo;
  var paymentLinkStatus = PaymentLinkStatus.initial;
  PaymentProvider({ required this.paymentRepo });

  Future<String> getBecameExclusiveLink() async {
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
      return '';
    }
  }


  Future<String> getAbonnementLink(int idPlan) async {
    paymentLinkStatus = PaymentLinkStatus.loading;
    notifyListeners();
    final response = await paymentRepo.getAbonnementLink(idPlan);
    if (response.error == null) {
      paymentLinkStatus = PaymentLinkStatus.loaded;
      notifyListeners();
      return response.response.data['url'];
    } else {
      paymentLinkStatus = PaymentLinkStatus.error;
      notifyListeners();
      return '';
    }
  }

  Future<bool> getStatusPayment() async{
    final response = await paymentRepo.getStatusPayment();
    if (response.error == null) {
      return response.response.data['isPaid'];
    } else {
      return false;
    }
  }





}