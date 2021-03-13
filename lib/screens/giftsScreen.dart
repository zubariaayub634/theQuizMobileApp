import 'package:flutter/material.dart';
import 'package:thequestion/localization/language_constants.dart';
import 'package:thequestion/models/coupan.dart';

import 'package:thequestion/utils/colors.dart';
import 'package:thequestion/widgets/coupanDialogueBox.dart';

class GiftScreen extends StatefulWidget {
  GiftScreen({Key key}) : super(key: key);

  @override
  _GiftScreenState createState() => _GiftScreenState();
}

class _GiftScreenState extends State<GiftScreen> {
  List<Coupan> _winningList = [
    Coupan("assets/img/haier.png", "20% Off on AC"),
    Coupan("assets/img/haier.png", "30% off on Tv"),
    Coupan("assets/img/haier.png", "Honda Bike"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(getTranslated(context, "gifts")),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [appColor, lighAppColor],
                    begin: Alignment(0.0, 2),
                    end: Alignment(0.1, 0.0),
                    tileMode: TileMode.repeated)),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(left: 10, bottom: 20, right: 10),
          // color: Colors.black38,
          child: ListView.builder(
              itemCount: _winningList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
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
                    child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width / 4.5,
                              height: MediaQuery.of(context).size.height / 6.5,
                              margin: EdgeInsets.only(left: 3),
                              clipBehavior: Clip.hardEdge,
                              //  padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  // borderRadius:
                                  //     BorderRadius.all(Radius.circular(6)),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      //  offset: Offset(0, 0),
                                    ),
                                  ],
                                  image: DecorationImage(
                                      image: AssetImage(
                                          _winningList[index].coupanImage),
                                      fit: BoxFit.fill)),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Column(
                                //  mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.1,
                                    margin: EdgeInsets.only(
                                      right: 20,
                                    ),
                                    child: Text(
                                      _winningList[index].coupanName,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: navColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.1,
                                    margin: EdgeInsets.only(top: 5, right: 20),
                                    child: Text(
                                      "From VendorName",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: navColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios,
                                color: appColor, size: 34),
                          ],
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    // setView(1);
                    CouponDialogueBox().showDialogueBox(context,  _winningList[index].coupanName,  _winningList[index].coupanImage);
                  },
                );
              }),
        ));
  }
}
