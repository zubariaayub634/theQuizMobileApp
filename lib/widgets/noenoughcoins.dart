import 'package:flutter/material.dart';
import 'package:thequestion/screens/coinsScreen.dart';
import 'package:thequestion/utils/colors.dart';
import 'package:thequestion/utils/routes.dart';

class NotEnoughCoins extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width * .8,
      height: height * .3,
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
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     GestureDetector(
          //         onTap: () {
          //           // Navigator.of(context).pop();
          //         },
          //         child: Icon(Icons.lightbulb, size: 50, color: appColor))
          //   ],
          // ),
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
                  onTap: () {
                    AppRoutes.push(context, Coins());
                  },
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
          // SizedBox(
          //   height: height * .01,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     GestureDetector(
          //         onTap: () {
          //           constValues().hintDialog(context,"helloo");
          //         },
          //         child: Container(
          //             width: width * .5,
          //             height: height * .06,
          //             decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(10),
          //                 color: appColor),
          //             child: Center(
          //               child: Text(
          //                 "Watch an add to get hint",
          //                 style: TextStyle(
          //                     color: Colors.white,
          //                     // fontWeight: FontWeight.bold,
          //                     fontSize: 14),
          //                 textAlign: TextAlign.center,
          //               ),
          //             )))
          //   ],
          // ),
        ],
      ),
    );
  }
}
