import 'package:flutter/material.dart';
import 'package:thequestion/routes/route_constants.dart';
import 'package:thequestion/screens/SubmitAnswer.dart';

import 'package:thequestion/screens/createPremiumAccount.dart';
import 'package:thequestion/screens/giftsScreen.dart';
import 'package:thequestion/screens/homePage.dart';
import 'package:thequestion/screens/otp.dart';
import 'package:thequestion/screens/resultScreen.dart';
import 'package:thequestion/screens/setLanguage.dart';
import 'package:thequestion/screens/signIn.dart';
import 'package:thequestion/screens/splashScreen.dart';

class CustomRouter {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    var passData = settings.arguments;

    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      // case registerRoute:
      //   return MaterialPageRoute(builder: (_) => Register());
      case signInRoute:
        return MaterialPageRoute(builder: (_) => SignIn());
      case oTPRoute:
        return MaterialPageRoute(builder: (_) => Otp());
      case setLanguageRoute:
        return MaterialPageRoute(builder: (_) => SetLanguage());
      // case setPasswordRoute:
      //   return MaterialPageRoute(builder: (_) => SetPassword());
      case homePageRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case submitAnswerPageRoute:
        return MaterialPageRoute(builder: (_) => SubmitAnswer());
      case giftPageRoute:
        return MaterialPageRoute(builder: (_) => GiftScreen());
      case premiumAccountPageRoute:
        return MaterialPageRoute(builder: (_) => CreatePremiumAccount());
      case resultPageRoute:
        return MaterialPageRoute(builder: (_) => ResultScreen());
      // case itemDetailPageRoute:
      //   return MaterialPageRoute(builder: (_) =>ItemDetail());
      // case maintenanceDetailPageRoute:
      //   return MaterialPageRoute(builder: (_) =>MaintenanceDetail(phoneCatagory: passData,));
      default:
      // return MaterialPageRoute(builder: (_) => NotFoundPage());
    }
  }
}
