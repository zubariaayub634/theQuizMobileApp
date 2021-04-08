import 'package:flutter/material.dart';
import 'package:thequestion/models/questionModel.dart';

class DataProvider extends ChangeNotifier {
  GameModel gameModel;

  int counter = 0;

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
    gameModel.coins = value;
    notifyListeners();
  }

  int get getCoins {
    return gameModel.coins;
  }

  incrementCoins() {
    if (gameModel.coins >= 0) {
      return gameModel.coins = gameModel.coins + 1;
    } else {return gameModel.coins = 1;}
    notifyListeners();
    // return coins = coins++;
    // notifyListeners();
  }

  deductCoins(int x) {
    if (gameModel.coins > x) {
      return gameModel.coins = gameModel.coins - x;
    } else {
      gameModel.coins = 0;
    }
    notifyListeners();
  }

  decrementCoin() {
    if (gameModel.coins > 0) {
      return gameModel.coins--;
    } else {}
    notifyListeners();
  }
}
