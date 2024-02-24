import 'package:flutter/material.dart';

class ParametersData extends ChangeNotifier {
  String _mathOperation = '';

  String get mathData => _mathOperation;

  void updateData(String newData) {
    _mathOperation = newData;
    notifyListeners();
  }
}