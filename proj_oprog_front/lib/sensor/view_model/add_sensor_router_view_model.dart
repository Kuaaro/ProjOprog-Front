import 'package:flutter/material.dart';

class AddSensorRouterViewModel extends ChangeNotifier {
  String? message;
  bool isError = false;

  void setMessage(String msg, {required bool isError}) {
    message = msg;
    this.isError = isError;
    notifyListeners();
  }

  void clearMessage() {
    message = null;
    isError = false;
    notifyListeners();
  }

  void reset() {
    message = null;
    isError = false;
    notifyListeners();
  }
}
