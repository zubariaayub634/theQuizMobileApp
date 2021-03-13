import 'package:flutter/material.dart';
import 'package:thequestion/screens/homePage.dart';
import 'package:thequestion/utils/colors.dart';
import 'package:thequestion/utils/styles.dart';

class VendorOffers extends StatefulWidget {
  VendorOffers({Key key}) : super(key: key);

  @override
  _VendorOffersState createState() => _VendorOffersState();
}

class _VendorOffersState extends State<VendorOffers> {
  List<String> _offersList = [
    "20% Offer on all the products",
    "Chance of Winning MotorCycle",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              HomePage.setLocalView(context, 5);
            },
            color: appColor,
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(left: 10, bottom: 20, right: 10),
            //padding: EdgeInsets.all(10),
            // color: Colors.black38,
            child: ListView.builder(
                itemCount: _offersList.length,
                itemBuilder: (context, index) {
                  return Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(10),
                      constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height / 7),
                      //  padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        // border: Border.all(color: lighAppColor, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: lighAppColor.withOpacity(0.8),
                            spreadRadius: 2,
                            blurRadius: 5,
                            //  offset: Offset(0, 0),
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        color: Colors.white,
                      ),
                      //  height: 150,
                      child: Text(
                        _offersList[index],
                        style: boldTextStyle,
                      ));
                }),
          ))
        ],
      ),
    );
  }
}
