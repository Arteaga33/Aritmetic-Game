import 'package:flutter/material.dart';

class ParametersData extends ChangeNotifier {
  //Defining vatiables:
  String _mathOperation = '';
  int _numberOfNumbers = 2;
  int _numberOfDigits = 2;
  int _timeLimit = 2;
  //TODO: Check a way to maintain the points even if the game closes.
  int _sumPoints = 0;
  int _subPoints = 0;
  int _multPoints = 0;
  int _divPoints = 0;

  //Setting the getters:
  String get mathData => _mathOperation;
  int get numberOfNumbers => _numberOfNumbers;
  int get numberOfDigits => _numberOfDigits;
  int get timeLimit => _timeLimit;
  int get sumPoints => _sumPoints;
  int get subPoints => _subPoints;
  int get multPoints => _multPoints;
  int get divPoints => _divPoints;

  void updateMathOperationData(String newData) {
    _mathOperation = newData;
    notifyListeners();
  }

  void updateNumberOfNumbers(int newNumberOfNumbers){
    _numberOfNumbers = newNumberOfNumbers;
    notifyListeners();
  }

  void updateNumberOfDigits(int newNumberOfDigits){
    _numberOfDigits = newNumberOfDigits;
    notifyListeners();
  }

  void updateTimeLimit(int newTimeLimit){
    _timeLimit = newTimeLimit;
    notifyListeners();
  }
  void updateSumPoints(int newSumPoints){
    _sumPoints = newSumPoints;
    notifyListeners();
  }
  
  void updateSubPoints(int newSubPoints){
    _subPoints = newSubPoints;
    notifyListeners();
  }
  void updateMultPoints(int newMultPoints){
    _multPoints = newMultPoints;
    notifyListeners();
  }
  void updateDivPoints(int newDivPoints){
    _divPoints = newDivPoints;
    notifyListeners();
  }
}