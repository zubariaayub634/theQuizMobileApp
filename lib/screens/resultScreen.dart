import 'package:flutter/material.dart';
import 'package:thequestion/screens/homePage.dart';
import 'package:thequestion/utils/colors.dart';
import 'package:thequestion/utils/styles.dart';

class ResultScreen extends StatefulWidget {
  final bool correct;
  ResultScreen({Key key, this.correct}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Image(
              image: AssetImage(
                  widget.correct
                  ? "assets/img/check.png"
                  : "assets/img/sorry.png",
              ),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width / 1.5,
              color: appColor,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            child: Text(

              widget.correct ? "Congratulations" : "Sorry",
              style: TextStyle(
                  color: lighAppColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.all(30),
            child: Text(
              widget.correct
                  ? "You have given the Right Answer"
                  : "You have given Wrong Answer",
              style: boldTextStyle,
            ),
          ),
          InkWell(
            child: Container(
                width: MediaQuery.of(context).size.width / 1.5,
                height: MediaQuery.of(context).size.height / 13,
                decoration: BoxDecoration(
                    color: appColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )),
                child: Center(
                  child: Text(
                    "Ok",
                    style: btnboldTextStyle,
                  ),
                )),
            onTap: () {
              HomePage.setLocalView(context, 0);
            },
          )
        ],
      ),
    );
  }
}
