import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thequestion/Provider/dataProvider.dart';
import 'package:thequestion/utils/colors.dart';
import 'package:thequestion/utils/routes.dart';

import 'homePage.dart';
import 'levels.dart';

class QuestionsOverview extends StatefulWidget {
  final int levelIndex;
  QuestionsOverview({this.levelIndex});
  @override
  _QuestionsOverviewState createState() => _QuestionsOverviewState();
}

class _QuestionsOverviewState extends State<QuestionsOverview> {
  var width, height;
  var coins;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        leading: InkWell(
            onTap: () {
              AppRoutes.push(context, Levels());
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        centerTitle: true,
        title: Text(
          "Questions Overview",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: Provider.of<DataProvider>(context, listen: false)
                    .gameModel
                    .levels[widget.levelIndex]
                    .questions
                    .length,
                itemBuilder: (BuildContext context, int index) {
                  return QuestionCard(
                      question:
                          Provider.of<DataProvider>(context, listen: false)
                              .gameModel
                              .levels[widget.levelIndex]
                              .questions[index]
                              .question);
                }),
          ),
          Row(
            children: [
              MaterialButton(
                color: appColor,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                ),
                animationDuration: Duration(seconds: 2),
                splashColor: Colors.blue[300],
                child: Text(
                  "Proceed to Questions",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
                onPressed: () {
                  AppRoutes.push(
                      context,
                      HomePage(
                        levelIndex: widget.levelIndex,
                      ));
                },
              ),
              SizedBox(
                width: 10.0,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.end,
          ),
        ],
      ),
    );
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
                            child: Icon(Icons.lightbulb,
                                size: 50, color: appColor))
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
}

class QuestionCard extends StatefulWidget {
  final question;
  QuestionCard({this.question});

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  var width, height;
  var coins;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return SizedBox(
      child: Card(
          elevation: 3.0,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${widget.question}",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          )),
      width: width * 0.99,
      height: height * 0.1,
    );
  }
}
