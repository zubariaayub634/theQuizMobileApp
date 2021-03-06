import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thequestion/Provider/dataProvider.dart';
import 'package:thequestion/adMob.dart/AddMob.dart';
import 'package:thequestion/screens/playscreen.dart';
import 'package:thequestion/screens/questionsOverview.dart';
import 'package:thequestion/utils/colors.dart';
import 'package:thequestion/utils/routes.dart';

import 'coinsScreen.dart';

class Levels extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Levels();
  }
}

class _Levels extends State<Levels> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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

  var width, height;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        // appBar: UpperBar(
        //   barName: "Levels",
        // ),
        appBar: AppBar(
          backgroundColor: appColor,
          leading: InkWell(
              onTap: () {
                AppRoutes.push(context, PlayScreen());

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Levels()),
                // );
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          // leading: BackButton(
          //   onPressed: (){
          //     AppRoutes.push(context, Levels());
          //   },
          // ),
          centerTitle: true,
          title: Text(
            "Levels",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                AppRoutes.push(context, Coins());
              },
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 5.0, bottom: 0.0, right: 10.0),
                    child: Image.asset("assets/img/coin.png",
                        color: Colors.white,
                        width: width * .1,
                        // fit: BoxFit.cover,
                        height: height * 0.039),
                  ),
                  Row(
                    children: [
                      Text(
                        // "coins : " + coins.toString() + "   ",
                        "coins : ",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        // "$coins",
                        "${Provider.of<DataProvider>(context, listen: false).gameModel.coins}",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "  ",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )
                      //                 _scaffoldKey.currentState.showSnackBar(
                      // SnackBar(content: ""));
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Container(
          width: width,
          height: height,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, int index) {
                    return GestureDetector(
                      onTap: () async {
                        Provider.of<DataProvider>(context, listen: false)
                            .setCounterZero();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuestionsOverview(
                              levelIndex: index,
                            ),
                          ),
                        );
                        interstitialAd.isLoaded;
                      },
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: width,
                                height: height * .1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 5),
                                          width: width * .13,
                                          height: height * .06,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Provider.of<DataProvider>(
                                                              context,
                                                              listen: false)
                                                          .gameModel
                                                          .levels[index]
                                                          .getCorrectlyAnsweredPercentage() <
                                                      100
                                                  ? Colors.orange
                                                  : Colors.green),
                                          child: Center(
                                            child: Provider.of<DataProvider>(
                                                            context,
                                                            listen: false)
                                                        .gameModel
                                                        .levels[index]
                                                        .getCorrectlyAnsweredPercentage() <
                                                    100
                                                ? Text(
                                                    (Provider.of<DataProvider>(
                                                                context,
                                                                listen: false)
                                                            .gameModel
                                                            .levels[index]
                                                            .getCorrectlyAnsweredPercentage()
                                                            .round()
                                                            .toString()) +
                                                        "%",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14),
                                                  )
                                                : Icon(Icons.done,
                                                    color: Colors.white),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(Provider.of<DataProvider>(
                                              context,
                                              listen: false)
                                              .gameModel
                                              .levels[index].name,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(width: width, height: 2, color: Colors.grey),
                        ],
                      ),
                    );
                  },
                  itemCount: Provider.of<DataProvider>(context, listen: false)
                      .gameModel
                      .levels
                      .length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
