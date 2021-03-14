import 'package:flutter/material.dart';
import 'package:thequestion/models/questionModel.dart';

class DataProvider extends ChangeNotifier {
  GameModel gameModel;

  int counter = 0;
  int coins = 20;

  incrementCounter() {
    counter = counter + 1;
    notifyListeners();
  }

  setCounterZero() {
    counter = 0;
    notifyListeners();
  }

  int get currentIndex {
    return counter;
  }

  // decrementCoins() {
  //   if (coins > 0) {
  //     coins--;
  //   } else {}
  //
  //   notifyListeners();
  // }

  reloadCoins(value) {
    coins = value;
    notifyListeners();
  }

  int get getCoins {
    return coins;
  }

  incrementCoins() {
    if (coins > 0) {
      return coins = coins + 1;
    } else {}
    notifyListeners();
    // return coins = coins++;
    // notifyListeners();
  }

  addCoins(int x) {
    if (coins > 0) {
      return coins = coins + x;
    } else {
      coins = x;
    }
    notifyListeners();
  }

  deductCoins(int x) {
    if (coins > x) {
      return coins = coins - x;
    } else {
      coins = 0;
    }
    notifyListeners();
  }

  decrementCoin() {
    if (coins > 0) {
      return coins--;
    } else {}
    notifyListeners();
  }
}
