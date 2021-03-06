import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:thequestion/adMob.dart/AddMob.dart';
import 'package:thequestion/screens/homePage.dart';
import 'package:thequestion/screens/videoquestion.dart';
import 'package:thequestion/utils/colors.dart';
import 'package:thequestion/utils/routes.dart';
import 'package:thequestion/utils/styles.dart';

class SubmitAnswer extends StatefulWidget {
  SubmitAnswer({Key key}) : super(key: key);

  @override
  _SubmitAnswerState createState() => _SubmitAnswerState();
}

class _SubmitAnswerState extends State<SubmitAnswer> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }

  //TODO: Ads Method...........code start........
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();
  AdmobInterstitial interstitialAd;
  bool ads = false;

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
  //
  @override
  void dispose() {
    interstitialAd.dispose();
    super.dispose();
  }

  //TODO: Ads Method...........code end........



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            _questionContainer(),
            _answerContainer("Dukhan", "a"),
            _answerContainer("Al Wakrah", "b"),
            _answerContainer("Doha", "c"),
            _answerContainer("Al khor", "d"),
            _btnContainer(),
          ],
        ),
      ),
    );
  }

  Widget _btnContainer() {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(top: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 13,
                decoration: BoxDecoration(
                    color: appColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )),
                child: Center(
                  child: Text(
                    "Next",
                    style: btnboldTextStyle,
                  ),
                )),
          ],
        ),
      ),
      onTap: () async {
        AppRoutes.push(context, VideoQuestions());
        // await _controller.reverse().then((value) => () {
        //       _controller.dispose();
        //     });
        HomePage.setLocalView(context, 0);
        // _controller.forward();
      },
    );
  }

  Widget _questionContainer() {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      // width: 200,
      child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "What is the capital of Qatr?",
            style: boldTextStyle,
          )),
    );
  }

  Widget _answerContainer(String value, String options) {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.all(10),
                    constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width / 1.7,
                      minHeight: MediaQuery.of(context).size.height / 15,
                      // maxWidth: MediaQuery.of(context).size.width/1.1
                    ),
                    decoration: BoxDecoration(
                        color: appColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                    child: Container(
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            clipBehavior: Clip.hardEdge,
                            margin: EdgeInsets.only(left: 10, right: 10),
                            height: MediaQuery.of(context).size.height / 30,
                            // padding: EdgeInsets.all(1),
                            width: MediaQuery.of(context).size.height / 30,
                            // clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                  colors: [lighAppColor, appColor],
                                  begin: FractionalOffset.topCenter,
                                  end: FractionalOffset.bottomCenter,
                                  tileMode: TileMode.clamp),
                              color: Colors.white,
                            ),
                            child: Text(options,
                                style: TextStyle(
                                    height: 1,
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500)),
                          ),
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width / 1.5,
                            ),
                            child: Text(
                              value,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
      onTap: () async {
        if (await interstitialAd.isLoaded) {
          interstitialAd.show();
        } else {
          // showSnackBar(
          //     'Interstitial ad is still loading...');
        }
        // await _controller.reverse().then((value) => () {
        //       _controller.dispose();
        //     });
        if (value == "Doha") {
          HomePage.setLocalView(context, 2);
        } else {
          HomePage.setLocalView(context, 3);
        }
      },
    );
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  // }
}
