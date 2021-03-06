import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {


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
    return  coins = coins +1;
  } else {

  }
  notifyListeners();
    // return coins = coins++;
    // notifyListeners();
  }

   decrementCoin() {
    if (coins > 0) {
    return  coins--;
    } else {

    }
    notifyListeners();
  }


}


