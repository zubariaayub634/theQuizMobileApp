import 'package:flutter/material.dart';
import 'package:thequestion/models/questionModel.dart';
import 'package:thequestion/utils/colors.dart';
import 'package:thequestion/utils/routes.dart';

import 'homePage.dart';

class QuestionsOverview extends StatefulWidget {
  final List<Question> questions;
  final int index;
  final List<LevelResult> result;
  QuestionsOverview({this.index, this.result, this.questions});
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
    // coins = Provider.of<DataProvider>(context, listen: false).getCoins;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        title: Text('Question Overview'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                TextsWidget(
                  texts: "What is capital of Pakistan?",
                ),
                TextsWidget(
                  texts: "Which Animal in video?",
                ),
                TextsWidget(
                  texts: "Who is guy in this audio?",
                ),
                TextsWidget(
                  texts: "Where badshahi Mosque Located?",
                ),
                TextsWidget(
                  texts: "Which Animal in video?",
                ),
                TextsWidget(
                  texts: "What is capital of Pakistan?",
                ),
                // TextsWidget(
                //   texts: "Where badshahi Mosque Located?",
                // ),
                // TextsWidget(
                //   texts: "Where badshahi Mosque Located?",
                // ),
                // child: ListView.builder(
                //   itemBuilder: (context, int index) {
                //     return levelList(index, snapshot.data);
                //   },
                //   itemCount: snapshot.data.length,
                // ),

                // TextsWidget(
                //   texts: "What is capital of Pakistan?",
                // ),
              ],
            ),
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
                        questions: widget.result[widget.index].questions,
                      ));
                },
              )
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

// class TextsWidget extends StatefulWidget {
//
//   final texts;
//   TextsWidget({this.texts});
//
//   @override
//   _TextsWidgetState createState() => _TextsWidgetState();
// }
//
// class _TextsWidgetState extends State<TextsWidget> {
//
//   var width, height;
//   var coins;
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     width = MediaQuery.of(context).size.width;
//     height = MediaQuery.of(context).size.height;
//
//     return FutureBuilder(
//       future: BaseHelper().getLevels(context),
//       builder: (context, snapshot,) {
//         if (snapshot.hasData) {
//           return Expanded(
//             child: ListView.builder(
//              itemBuilder: (context, int index) {
//                return levelList(index, snapshot.data);
//              },
//              itemCount: snapshot.data.length = 1,
//                 ),
//             // child: ListView.builder(
//             //   itemBuilder: (context, int index) {
//             //     return levelList(index, snapshot.data);
//             //   },
//             //   itemCount: snapshot.data.length,
//             // ),
//           );
//         } else {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },
//     );
//   }
//
//   Widget levelList(int index, List<LevelResult> result) {
//     return GestureDetector(
//       onTap: () async {
//         Provider.of<DataProvider>(context, listen: false).setCounterZero();
//         AppRoutes.push(
//             context,
//             HomePage(
//               questions: result[index].questions,
//             )
//         );
//       },
//       child: SizedBox(
//         child: Card(
//             elevation: 3.0,
//             child: Padding(
//               padding: const EdgeInsets.only(left: 10),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text("${widget.texts}",
//                     style: TextStyle(
//                       fontSize: 17,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ],
//               ),
//             )),
//         width: width * 0.99,
//         height: height * 0.1,
//       ),
//     );
//   }
//
// }

class TextsWidget extends StatefulWidget {
  final texts;
  TextsWidget({this.texts});

  @override
  _TextsWidgetState createState() => _TextsWidgetState();
}

class _TextsWidgetState extends State<TextsWidget> {
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
                  "${widget.texts}",
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
