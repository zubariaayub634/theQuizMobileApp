import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:thequestion/adMob.dart/AddMob.dart';
import 'package:thequestion/utils/colors.dart';
import 'package:thequestion/widgets/customappbar.dart';
import 'package:provider/provider.dart';
import 'package:thequestion/Provider/dataprovider.dart';

class Coins extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Coins();
  }
}

class _Coins extends State<Coins> {





  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  AdmobInterstitial interstitialAd;
  AdmobReward rewardAd;
  @override
  void initState() {
    super.initState();
    interstitialAd = AdmobInterstitial(
      adUnitId: getInterstitialAdUnitId(),
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed) interstitialAd.load();
      },
    );
    rewardAd = AdmobReward(
      adUnitId: getRewardBasedVideoAdUnitId(),
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed) rewardAd.load();
        // handleEvent(event, args, 'Reward');

      },
    );

    interstitialAd.load();
    rewardAd.load();
  }

  @override
  void dispose() {
    interstitialAd.dispose();
    // rewardAd.dispose();
    super.dispose();
  }



  void showSnackBar(String content) {
    scaffoldState.currentState.showSnackBar(
      SnackBar(
        content: Text(content),
        duration: Duration(milliseconds: 1500),
      ),
    );
  }

var width;
  var height;
  var coins;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    coins = Provider.of<DataProvider>(context, listen: false).getCoins;
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: UpperBar(
        barName: "Coins",
      ),
      body: Container(
        width: width,
        height: height,
        child: Column(
          children: [
            SizedBox(
              height: height * .06,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/img/coin.png",
                    color: appColor,
                    width: width * .6,
                    fit: BoxFit.cover,
                    height: height * .26)
              ],
            ),
            SizedBox(
              height: height * .01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("you have " + coins.toString() + " coins",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: appColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(
              height: height * .05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                coinpaid("buy 10 coins for 0.99\$"),
              ],
            ),
            SizedBox(
              height: height * .01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                coinpaid("buy 100 coins for 8.99\$"),
              ],
            ),
            SizedBox(
              height: height * .01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                coinpaid("buy 500 coins for 16.99\$"),
              ],
            ),
          ],
        ),
      ),
    );
  }




  Widget coinpaid(String text,) {
    return GestureDetector(
        onTap: () async {

          if (await interstitialAd.isLoaded) {
             // interstitialAd.show();
            rewardAd.show();
            setState(() {
              coins =  Provider.of<DataProvider>(context, listen: false).incrementCoins();
            });

          } else {

            showSnackBar(
                'Interstitial ad is still loading...');
          }
          // Provider.of<DataProvider>(context, listen: false).reloadCoins(5);
          // constValues().coinsbuyDialog(context);
        },
        child: Container(
          width: width * .55,
          height: height * .08,
          decoration: BoxDecoration(
            color: appColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text("$text",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
          ),
        ));
  }


}

// RewardedVideoAd.instance.listener =
// (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
// if (event == RewardedVideoAdEvent.completed) {
// setState(() {
// print ("::debug:: ads should be reloaded");
// RewardedVideoAd.instance.load(adUnitId: "ca-app-pub-3940256099942544/5224354917",
// targetingInfo: targetingInfos);
// });
// }
// TODO: Implement _onRewardedAdEvent()
