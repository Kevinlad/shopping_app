import 'package:flutter/material.dart';

class PaymentProvider extends ChangeNotifier {
  String _selectedPaymentMethod = "Paypal";

  String get selectedPaymentMethod => _selectedPaymentMethod;

  void selectPaymentMethod(String method) {
    _selectedPaymentMethod = method;
    notifyListeners();
  }
}
