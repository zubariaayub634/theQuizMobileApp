import 'package:flutter/material.dart';
import 'package:thequestion/screens/questionsOverview.dart';
import 'package:thequestion/utils/styles.dart';
import 'package:thequestion/widgets/customappbar.dart';

class TextQuestion extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TextQuestion();
  }
}

class _TextQuestion extends State<TextQuestion> {
  var width, height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      appBar: UpperBar(
        barName: "Questions",
      ),
      body: Container(
        width: width,
        height: height,
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(top: 10),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.black),
                  ),
                  animationDuration: Duration(seconds: 2),
                  splashColor: Colors.blue[300],
                  child: Text("Question Overview"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QuestionsOverview()),
                    );
                  },
                )),
            SizedBox(height: height * .03),
            _questionContainer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 2),
                  width: width * .1,
                  height: height * .06,
                  child: TextField(
                    maxLength: 1,
                    maxLengthEnforced: true,
                    decoration: InputDecoration(counterText: ""),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 2),
                  width: width * .1,
                  height: height * .06,
                  child: TextField(
                    maxLength: 3,
                    maxLengthEnforced: true,
                    decoration: InputDecoration(counterText: ""),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 2),
                  width: width * .1,
                  height: height * .06,
                  child: TextField(
                    maxLength: 1,
                    maxLengthEnforced: true,
                    decoration: InputDecoration(counterText: ""),
                  ),
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Container(
            //         margin: EdgeInsets.only(right: 2),
            //         width: width * .1,
            //         height: 1,
            //         color: Colors.grey),
            //     Container(
            //         margin: EdgeInsets.only(right: 2),
            //         width: width * .1,
            //         height: 1,
            //         color: Colors.grey),
            //     Container(
            //         margin: EdgeInsets.only(right: 2),
            //         width: width * .1,
            //         height: 1,
            //         color: Colors.grey),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  Widget _questionContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height * .08,
          // color: Colors.black,
          margin: EdgeInsets.only(
            top: 10,
            left: 20,
            right: 20,
          ),
          // width: 200,
          child: Text(
            "Which animal barks",
            style: boldTextStyle,
          ),
        ),
      ],
    );
  }
}
