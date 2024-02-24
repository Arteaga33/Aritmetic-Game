import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ParametersData extends ChangeNotifier {
  String _mathOperation = '';

  String get mathData => _mathOperation;

  void updateData(String newData) {
    _mathOperation = newData;
    notifyListeners();
    print(newData);
  }
}