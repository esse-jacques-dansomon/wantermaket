import 'package:flutter/material.dart';

import '../data/repositories/payment_repo.dart';

class PaymentProvider extends ChangeNotifier {
  final PaymentRepo paymentRepo;
  PaymentProvider({ required this.paymentRepo });

  Future<String> getBecameExclusiveLink() async {
    final response = await paymentRepo.getBecameExclusiveLink();
    if (response.error == null) {
      return response.response.data['url'];
    } else {
      return '';
    }
  }
}