import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thequestion/adMob.dart/AddMob.dart';
import 'package:thequestion/screens/coinsScreen.dart';
import 'package:thequestion/screens/levels.dart';
import 'package:thequestion/utils/colors.dart';
import 'package:thequestion/utils/routes.dart';

class PlayScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PlayScreen();
  }
}

class _PlayScreen extends State<PlayScreen> {
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();
  //TODO: Ads Method...........code start........
  AdmobInterstitial interstitialAd;
  @override
  void initState() {
    super.initState();
    interstitialAd = AdmobInterstitial(
      adUnitId: getInterstitialAdUnitId(),
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed) interstitialAd.load();
      },
    );
    interstitialAd.load();
  }

  @override
  void dispose() {
    interstitialAd.dispose();
    super.dispose();
  }
  //TODO: Ads Method...........code end........

  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: _scaffoldState,
        backgroundColor: Colors.white,
        body: Container(
            width: width,
            height: height,
            child: Column(
              children: [
                SizedBox(
                  height: height * .05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.library_music,
                      color: appColor,
                      size: 40,
                    ),
                    SizedBox(
                      width: width * .03,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * .25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        AppRoutes.push(context, Levels());
                      },
                      child: Container(
                        width: width * .42,
                        height: height * .08,
                        decoration: BoxDecoration(
                          color: appColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.play_circle_fill_rounded,
                                    color: Colors.white, size: 35),
                                Text(
                                  "play",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * .02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: width * .42,
                      height: height * .1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  if (await interstitialAd.isLoaded) {
                                    interstitialAd.show();
                                  } else {
                                    // showSnackBar(
                                    //     'Interstitial ad is still loading...');
                                  }
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 5),
                                  width: width * .2,
                                  height: height * .1,
                                  decoration: BoxDecoration(
                                    color: appColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                      child: Image.asset("assets/img/ad.png",
                                          color: Colors.white,
                                          width: 30,
                                          height: 30)),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  AppRoutes.push(context, Coins());
                                },
                                child: Container(
                                  width: width * .2,
                                  height: height * .1,
                                  decoration: BoxDecoration(
                                    color: appColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                      child: Image.asset("assets/img/coin.png",
                                          color: Colors.white,
                                          width: 30,
                                          height: 30)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
