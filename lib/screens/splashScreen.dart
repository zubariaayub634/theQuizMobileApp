import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thequestion/Provider/dataprovider.dart';
import 'package:thequestion/models/questionModel.dart';
import 'package:thequestion/screens/playscreen.dart';
import 'package:thequestion/utils/routes.dart';

Future<GameModel> getLevels(BuildContext context) async {
  var data = await DefaultAssetBundle.of(context)
      .loadString("myquestions/questions.json");

  final jsonResult = json.decode(data);
  print(jsonResult['Levels'][0]['Questions'][0]['option']);
  GameModel gameModel = GameModel.fromJson(jsonResult);

  return gameModel;
}

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  double currentValue;
  Animation curveAnimation;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _splashdelay();
  }

  _splashdelay() async {
    _animationController =
        AnimationController(duration: Duration(seconds: 6), vsync: this);
    curveAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticInOut,
    );
    _animationController.addListener(() {
      if (_animationController.isCompleted) {
        _animationController.dispose();
        Future.delayed(Duration(seconds: 0), () async {
          SharedPreferences _prefs = await SharedPreferences.getInstance();
          bool check = _prefs.containsKey('languageCode');
          Provider.of<DataProvider>(context, listen: false)
              .gameModel = await getLevels(context);
          AppRoutes.push(context, PlayScreen());
          // Navigator.pushNamed(context, setLanguageRoute);
          // check
          //     ? Navigator.pushNamed(context, signInRoute)
          //     : Navigator.pushNamed(context, setLanguageRoute);
        });
      }
    });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PositionedTransition(
            rect: RelativeRectTween(
                    begin: RelativeRect.fromLTRB(400, 600, 0, 0),
                    end: RelativeRect.fromLTRB(0, 0, 0, 0))
                .animate(curveAnimation),
            child: Container(
              margin: EdgeInsets.all(30),
              width: 100,
              height: MediaQuery.of(context).size.height / 6,
              child: Image(
                image: AssetImage('assets/img/appLogo.png'),
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.height / 7,
              ),
              // decoration:
              //     BoxDecoration(color: Colors.black12, shape: BoxShape.circle),
            ),
          )
        ],
      ),
    );
  }
}
