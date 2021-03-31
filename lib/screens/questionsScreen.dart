import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:thequestion/Provider/dataProvider.dart';
import 'package:thequestion/adMob.dart/AddMob.dart';
import 'package:thequestion/models/questionModel.dart';
import 'package:thequestion/screens/audioQuestion.dart';
import 'package:thequestion/screens/homePage.dart';
import 'package:thequestion/screens/videoQuestion.dart';
import 'package:thequestion/utils/colors.dart';
import 'package:thequestion/utils/routes.dart';
import 'package:thequestion/utils/styles.dart';
import 'package:thequestion/screens/playscreen.dart';

class QuestionsScreen extends StatefulWidget {
  final int questionIndex;
  final int levelIndex;
  QuestionsScreen({this.questionIndex, this.levelIndex});

  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  // with SingleTickerProviderStateMixin {

  //TODO: Ads Method...........code start........
  // GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();
  AdmobInterstitial interstitialAd;
  bool ads = false;

  @override
  void initState() {
    super.initState();
    interstitialAd = AdmobInterstitial(
      adUnitId: getInterstitialAdUnitId(),
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed) interstitialAd.load();
      },
    );
    interstitialAd.load();
  }

  @override
  void dispose() {
    interstitialAd.dispose();
    super.dispose();
  }

  //TODO: Ads Method...........code end........

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   //  _initiateContainer();
  //   // _controller.addListener(() {
  //   //   if (_controller.isCompleted) {
  //   //     _controller.stop();
  //   //   }
  //   // });
  // }

  var width;
  var height;
  List<String> displayedAnswer = List<String>();
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    int type = Provider.of<DataProvider>(context, listen: false)
        .gameModel
        .levels[widget.levelIndex]
        .questions[widget.questionIndex]
        .type;
    String question = Provider.of<DataProvider>(context, listen: false)
        .gameModel
        .levels[widget.levelIndex]
        .questions[widget.questionIndex]
        .question
        .toString();
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        //  mainAxisAlignment: MainAxisAlignment.center,
        children: [
          type == 0
              ? _questionContainer(question)
              : type == 1
                  ? Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * .05),
                        _questionContainer(question),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * .33,
                          child: VideoQuestions(
                            url: Provider.of<DataProvider>(context,
                                    listen: false)
                                .gameModel
                                .levels[widget.levelIndex]
                                .questions[widget.questionIndex]
                                .url,
                          ),
                        ),
                      ],
                    )
                  : type == 3
                      ? Column(
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .008),
                            _questionContainer(question),
                            AudioQuestion(
                              url: Provider.of<DataProvider>(context,
                                      listen: false)
                                  .gameModel
                                  .levels[widget.levelIndex]
                                  .questions[widget.questionIndex]
                                  .url,
                            ),
                          ],
                        )
                      : type == 4
                          ? Column(
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .008),
                                _questionContainer(question),
                              ],
                            )
                          : Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.all(20),
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    decoration: BoxDecoration(
                                        color: lighAppColor.withOpacity(0.2),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        )),
                                    child: Center(
                                        child: Image(
                                      image: NetworkImage(
                                          Provider.of<DataProvider>(context,
                                                  listen: false)
                                              .gameModel
                                              .levels[widget.levelIndex]
                                              .questions[widget.questionIndex]
                                              .url),
                                      fit: BoxFit.fill,
                                    ))),
                                _questionContainer(
                                  question,
                                ),
                              ],
                            ),
          (Provider.of<DataProvider>(context, listen: false)
                  .gameModel
                  .levels[widget.levelIndex]
                  .questions[widget.questionIndex]
                  .lockedTill
                  .isAfter(DateTime.now()))
              ? Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Question Blocked.\nPlease try again later.",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      DialogButton(
                          width: MediaQuery.of(context).size.width * 0.8,
                          color: appColor,
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
                          onPressed: () {
                            setState(() {
                              Provider.of<DataProvider>(context, listen: false)
                                  .incrementCounter();
                              AppRoutes.push(
                                  context,
                                  HomePage(
                                    levelIndex: widget.levelIndex,
                                  ));
                            });
                          })
                    ],
                  ),
                )
              : (Provider.of<DataProvider>(context, listen: false)
                      .gameModel
                      .levels[widget.levelIndex]
                      .questions[widget.questionIndex]
                      .correctlyAnswered
                  ? Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Question Already Answered Correctly.",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                          DialogButton(
                            width: MediaQuery.of(context).size.width * 0.8,
                            color: appColor,
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
                            onPressed: () {
                              setState(() {
                                Provider.of<DataProvider>(context,
                                        listen: false)
                                    .incrementCounter();
                                AppRoutes.push(
                                    context,
                                    HomePage(
                                      levelIndex: widget.levelIndex,
                                    ));

                                // User.userData.index = User.userData.index + 1;
                              });
                            },
                          )
                        ],
                      ),
                    )
                  : type == 4
                      ? _textAnswerContainer(
                          Provider.of<DataProvider>(context, listen: false)
                              .gameModel
                              .levels[widget.levelIndex]
                              .questions[widget.questionIndex]
                              .correctAnswer,
                          Provider.of<DataProvider>(context, listen: false)
                              .gameModel
                              .levels[widget.levelIndex]
                              .questions[widget.questionIndex]
                              .options)
                      : Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, int index) {
                              return _answerContainer(
                                Provider.of<DataProvider>(context,
                                        listen: false)
                                    .gameModel
                                    .levels[widget.levelIndex]
                                    .questions[widget.questionIndex]
                                    .options[index]
                                    .optionName
                                    .toString(),
                                index,
                                Provider.of<DataProvider>(context,
                                        listen: false)
                                    .gameModel
                                    .levels[widget.levelIndex]
                                    .questions[widget.questionIndex]
                                    .correctAnswer,
                              );
                            },
                            itemCount: Provider.of<DataProvider>(context,
                                    listen: false)
                                .gameModel
                                .levels[widget.levelIndex]
                                .questions[widget.questionIndex]
                                .options
                                .length,
                          ),
                        )),
        ],
      ),
    );
  }

  Widget _textAnswerContainer(String correctAnswer, List<Options> options) {
    int charsPerRow = 4;
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              width: width * 0.5,
              child: Center(
                child: ListView.builder(
                  itemCount: correctAnswer.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            (index < displayedAnswer.length)
                                ? displayedAnswer[index]
                                    .toString()
                                    .toUpperCase()
                                : " ",
                            style: TextStyle(color: appColor, fontSize: 25),
                          ),
                          Container(
                            width: 40,
                            color: Colors.grey,
                            height: 5,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              width: width * 0.6,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: charsPerRow,
                  ),
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: MaterialButton(
                          onPressed: () {
                            print(options[index].optionName);
                            displayedAnswer.add(options[index].optionName);
                            if (displayedAnswer.length >=
                                correctAnswer.length) {
                              bool matches = true;
                              for (int i = 0; i < correctAnswer.length; i++) {
                                if (displayedAnswer[i] != correctAnswer[i]) {
                                  matches = false;
                                  break;
                                }
                              }
                              if (matches) {
                                correctAnswerResponse();
                              } else {
                                wrongAnswerResponse();
                              }
                            }
                            setState(() {});
                          },
                          child: Center(
                            child: Text(
                              options[index]
                                  .optionName
                                  .toString()
                                  .toUpperCase(),
                              style: TextStyle(color: appColor),
                            ),
                          ),
                        ),
                        decoration:
                            BoxDecoration(border: Border.all(color: appColor)),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }

  void wrongAnswerResponse() {
    width = MediaQuery.of(context).size.width * .8;
    height = MediaQuery.of(context).size.height * .3;
    Provider.of<DataProvider>(context, listen: false)
        .gameModel
        .levels[widget.levelIndex]
        .questions[widget.questionIndex]
        .correctlyAnswered = false;
    Provider.of<DataProvider>(context, listen: false)
        .gameModel
        .levels[widget.levelIndex]
        .questions[widget.questionIndex]
        .lockedTill = DateTime.now().add(Duration(minutes: 30));
    Alert(
      context: context,
      type: AlertType.error,
      title: "That's Wrong!\nTry it after 30 minutes.",
      style: AlertStyle(
        isCloseButton: false,
        isOverlayTapDismiss: false,
        titleStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
      ),
      content: Container(),
      buttons: [
        DialogButton(
            color: appColor,
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
            onPressed: () {
              setState(() {
                if (widget.questionIndex ==
                    (Provider.of<DataProvider>(context, listen: false)
                            .gameModel
                            .levels[widget.levelIndex]
                            .questions
                            .length -
                        1)) {
                  // Provider.of<DataProvider>(context, listen: false).setCounterZero();
                  AppRoutes.makeFirst(context, PlayScreen());
                } else {
                  Provider.of<DataProvider>(context, listen: false)
                      .incrementCounter();
                  AppRoutes.push(
                      context,
                      HomePage(
                        levelIndex: widget.levelIndex,
                      ));
                }

                // User.userData.index = User.userData.index + 1;
              });
            })
      ],
    ).show();
  }

  void correctAnswerResponse() {
    Provider.of<DataProvider>(context, listen: false).incrementCoins();
    Provider.of<DataProvider>(context, listen: false)
        .gameModel
        .levels[widget.levelIndex]
        .questions[widget.questionIndex]
        .correctlyAnswered = true;
    // Navigator.of(context).pop();
    setState(() {
      if (widget.questionIndex ==
          (Provider.of<DataProvider>(context, listen: false)
                  .gameModel
                  .levels[widget.levelIndex]
                  .questions
                  .length -
              1)) {
        // Provider.of<DataProvider>(context, listen: false).setCounterZero();
        AppRoutes.makeFirst(context, PlayScreen());
      } else {
        Provider.of<DataProvider>(context, listen: false).incrementCounter();
        AppRoutes.push(
            context,
            HomePage(
              levelIndex: widget.levelIndex,
            ));
      }

      // User.userData.index = User.userData.index + 1;
    });
  }

  Widget _answerContainer(String value, int index, var correctAnswer) {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.all(10),
                    constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width / 1.7,
                      minHeight: MediaQuery.of(context).size.height / 15,
                      // maxWidth: MediaQuery.of(context).size.width/1.1
                    ),
                    decoration: BoxDecoration(
                        color: appColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width / 1.5,
                            ),
                            child: Text(
                              value,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
      onTap: () async {
        if (value.toString() != correctAnswer.toString()) {
          wrongAnswerResponse();
        } else {
          correctAnswerResponse();
        }

        if (widget.questionIndex ==
            (Provider.of<DataProvider>(context, listen: false)
                    .gameModel
                    .levels[widget.levelIndex]
                    .questions
                    .length -
                4)) {
          // await interstitialAd.load();
          interstitialAd.show();
        } else {
          // showSnackBar(
          //     'Interstitial ad is still loading...');
        }

        // await _controller.reverse().then((value) => () {
        //       _controller.dispose();
        //     });
        // if (value == "Doha") {
        //   HomePage.setLocalView(context, 2);
        // } else {
        //   HomePage.setLocalView(context, 3);
        // }
      },
    );
  }

  Widget _questionContainer(String text) {
    return Padding(
      padding: EdgeInsets.only(left: 10, top: 10.0, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              text.toString(),
              textAlign: TextAlign.center,
              maxLines: 3,
              style: boldTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
