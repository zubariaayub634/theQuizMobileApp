import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thequestion/Provider/dataprovider.dart';
import 'package:thequestion/screens/homePage.dart';
import 'package:thequestion/utils/colors.dart';
import 'package:thequestion/utils/routes.dart';

class constValues {
  var width, height;
  var coins;
  coinsbuyDialog(BuildContext context) async {
    width = MediaQuery.of(context).size.width * .8;
    height = MediaQuery.of(context).size.height * .3;
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          contentPadding: EdgeInsets.only(top: 10.0),
          content: Container(
            width: width,
            height: height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                          width: width * .2,
                          height: height * .06,
                          child: Icon(Icons.close, color: Colors.black)),
                    )
                  ],
                ),
                SizedBox(
                  height: height * .02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                          width: width * .2,
                          height: height * .06,
                          child: Icon(Icons.done,
                              size: width * .12, color: Colors.green)),
                    )
                  ],
                ),
                SizedBox(
                  height: height * .15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "That's Right!",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * .02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "You Earned 5 coins!",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * .2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: width * .55,
                        height: height * .2,
                        decoration: BoxDecoration(
                            color: appColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            "Next Question",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  void wrongAnswerDialog(BuildContext context) async {
    width = MediaQuery.of(context).size.width * .8;
    height = MediaQuery.of(context).size.height * .3;
    coins = Provider.of<DataProvider>(context, listen: false).decrementCoin;

    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          contentPadding: EdgeInsets.only(top: 10.0),
          content: Container(
            width: width,
            height: height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        // Navigator.of(context).pop();
                        //TODO:  Pop_UP top black icon
                        final cron = Cron();
                        cron.schedule(new Schedule.parse('*/1 * * * *'), () async {
                          print('every one minutes');
                          Navigator.of(context).pop();
                        });
                      },
                      child: Container(
                          width: width * .2,
                          height: height * .06,
                          child: Icon(Icons.close, color: Colors.black)),
                    )
                  ],
                ),
                SizedBox(
                  height: height * .02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        //TODO:  ouhguig
                          // Provider.of<DataProvider>(context, listen: false).decrementCoin;
                        // Navigator.of(context).pop();

                        //TODO:  Pop_UP top black icon
                        final cron = Cron();
                        cron.schedule(new Schedule.parse('*/1 * * * *'), () async {
                          print('every one minutes');
                          Navigator.of(context).pop();
                        });

                      },
                      child: Container(
                          width: width * .2,
                          height: height * .06,
                          child: Icon(Icons.close, size: width * .12, color: Colors.red)),
                    )
                  ],
                ),
                SizedBox(
                  height: height * .15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "That's Wrong!",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * .02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "try it after 30 minutes",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * .2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        //TODO:  ouhguighog
                        // final cron = Cron();
                        // cron.schedule(new Schedule.parse('*/1 * * * *'), () async {
                        //   print('every one minutes');
                          // AppRoutes.push(context, HomePage());
                        // });
                      },
                      child: Container(
                        width: width * .55,
                        height: height * .2,
                        decoration: BoxDecoration(
                            color: appColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            "Next Question",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));

  }

  void hintDialog(BuildContext context, String hint) async {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          contentPadding: EdgeInsets.only(top: 10.0),
          content: Container(
            width: width * .8,
            height: height * .2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                          width: width * .2,
                          height: height * .03,
                          child: Icon(Icons.close, color: Colors.black)),
                    )
                  ],
                ),
                SizedBox(
                  height: height * .01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          // Navigator.of(context).pop();
                        },
                        child: Icon(Icons.lightbulb, size: 50, color: appColor))
                  ],
                ),
                SizedBox(
                  height: height * .01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      hint.toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  noenoughCoinDialog(BuildContext context) async {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          contentPadding: EdgeInsets.only(top: 10.0),
          content: Container(
            width: width * .8,
            height: height * .4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                          width: width * .2,
                          height: height * .03,
                          child: Icon(Icons.close, color: Colors.black)),
                    )
                  ],
                ),
                SizedBox(
                  height: height * .01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          // Navigator.of(context).pop();
                        },
                        child: Icon(Icons.lightbulb, size: 50, color: appColor))
                  ],
                ),
                SizedBox(
                  height: height * .02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "not enough Coin to get hint!",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * .04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {},
                        child: Container(
                            width: width * .5,
                            height: height * .06,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: appColor),
                            child: Center(
                              child: Text(
                                "Buy Coins",
                                style: TextStyle(
                                    color: Colors.white,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 14),
                                textAlign: TextAlign.center,
                              ),
                            )))
                  ],
                ),
                SizedBox(
                  height: height * .01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          //TODO: Call him hintDialog:
                          print("heeee");

                        },
                        child: Container(
                            width: width * .5,
                            height: height * .06,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: appColor),
                            child: Center(
                              child: Text(
                                "Watch an add to get hint",
                                style: TextStyle(
                                    color: Colors.white,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 14),
                                textAlign: TextAlign.center,
                              ),
                            )))
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}


