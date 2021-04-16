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
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
                    return MaterialButton(
                      onPressed: () {
                        print(index);
                        Provider.of<DataProvider>(context, listen: false)
                            .counter = index;
                        AppRoutes.push(
                            context,
                            HomePage(
                              levelIndex: widget.levelIndex,
                            ));
                      },
                      child: QuestionCard(
                          Provider.of<DataProvider>(context, listen: false)
                              .gameModel
                              .levels[widget.levelIndex]
                              .questions[index]
                              .question,
                          Provider.of<DataProvider>(context, listen: false)
                              .gameModel
                              .levels[widget.levelIndex]
                              .questions[index]
                              .correctlyAnswered),
                    );
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
                    Provider.of<DataProvider>(context, listen: false).counter = 0;
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
      ),
    );
  }
}

class QuestionCard extends StatefulWidget {
  final String question;
  final bool status;
  QuestionCard(this.question, this.status);

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.question}",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                widget.status
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      )
                    : Container(),
              ],
            ),
          )),
      width: width * 0.99,
      height: height * 0.1,
    );
  }
}
