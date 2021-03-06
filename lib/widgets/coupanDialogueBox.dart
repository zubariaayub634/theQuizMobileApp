import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thequestion/utils/colors.dart';
import 'package:thequestion/utils/styles.dart';

class CoupanDialogeBox {
  void showDialogeBox(
    BuildContext context,
    String voucherdetail,
    String profileImage,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 02, sigmaY: 02),
          child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(05.0)),

              // backgroundColor: Color(MyColors().appcolor),
              child: Wrap(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: MediaQuery.of(context).size.height / 4.5,
                      margin: EdgeInsets.only(left: 30, right: 30, top: 30),
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
                            image: AssetImage(profileImage), fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.all(30),
                      child: Text(
                        voucherdetail,
                        style: boldTextStyle,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.4,
                    height: MediaQuery.of(context).size.height / 3,
                    margin: EdgeInsets.only(left: 30, right: 30),
                    child: Image(
                      image: AssetImage("assets/img/qrCode.png"),
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              )),
        );
      },
    );
  }
}
