import 'package:admob_flutter/admob_flutter.dart';
import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:thequestion/Provider/dataprovider.dart';
import 'package:thequestion/adMob.dart/AddMob.dart';
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
  @override
  Widget build(BuildContext context) {
    // int ind = Provider.of<DataProvider>(context, listen: false).currentIndex;
    Provider.of<DataProvider>(context, listen: false).decrementCoin();
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        //  mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Provider.of<DataProvider>(context, listen: false)
                      .gameModel
                      .levels[widget.levelIndex]
                      .questions[widget.questionIndex]
                      .type ==
                  0
              ? _questionContainer(
                  Provider.of<DataProvider>(context, listen: false)
                      .gameModel
                      .levels[widget.levelIndex]
                      .questions[widget.questionIndex]
                      .question
                      .toString())
              : Provider.of<DataProvider>(context, listen: false)
                          .gameModel
                          .levels[widget.levelIndex]
                          .questions[widget.questionIndex]
                          .type ==
                      1
                  ? Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * .05),
                        _questionContainer(
                            Provider.of<DataProvider>(context, listen: false)
                                .gameModel
                                .levels[widget.levelIndex]
                                .questions[widget.questionIndex]
                                .question
                                .toString()),
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
                  : Provider.of<DataProvider>(context, listen: false)
                              .gameModel
                              .levels[widget.levelIndex]
                              .questions[widget.questionIndex]
                              .type ==
                          3
                      ? Column(
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .008),
                            _questionContainer(Provider.of<DataProvider>(
                                    context,
                                    listen: false)
                                .gameModel
                                .levels[widget.levelIndex]
                                .questions[widget.questionIndex]
                                .question
                                .toString()),
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
                      : Column(
                          children: [
                            Container(
                                margin: EdgeInsets.all(20),
                                width: MediaQuery.of(context).size.width / 1.1,
                                height: MediaQuery.of(context).size.height / 3,
                                decoration: BoxDecoration(
                                    color: lighAppColor.withOpacity(0.2),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    )),
                                child: Center(
                                    child: Image(
                                  image: NetworkImage(Provider.of<DataProvider>(
                                          context,
                                          listen: false)
                                      .gameModel
                                      .levels[widget.levelIndex]
                                      .questions[widget.questionIndex]
                                      .url),
                                  fit: BoxFit.fill,
                                ))),
                            _questionContainer(
                              Provider.of<DataProvider>(context, listen: false)
                                  .gameModel
                                  .levels[widget.levelIndex]
                                  .questions[widget.questionIndex]
                                  .question
                                  .toString(),
                            ),
                          ],
                        ),
          (Provider.of<DataProvider>(context, listen: false)
                  .gameModel
                  .levels[widget.levelIndex]
                  .questions[widget.questionIndex]
                  .lockedTill
                  .isAfter(DateTime.now()))
              ? Text("blocked")
              : Container(),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, int index) {
              return _answerContainer(
                Provider.of<DataProvider>(context, listen: false)
                    .gameModel
                    .levels[widget.levelIndex]
                    .questions[widget.questionIndex]
                    .options[index]
                    .optionName
                    .toString(),
                index,
                Provider.of<DataProvider>(context, listen: false)
                    .gameModel
                    .levels[widget.levelIndex]
                    .questions[widget.questionIndex]
                    .correctAnswer,
              );
            },
            itemCount: Provider.of<DataProvider>(context, listen: false)
                .gameModel
                .levels[widget.levelIndex]
                .questions[widget.questionIndex]
                .options
                .length,
          )),

          // _answerContainer("Al Wakrah", "b"),
          // _answerContainer("Doha", "c"),
          // _questionContainer(widget.questions[widget.index].question.toString()),
        ],
      ),
    );
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
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Container(
                          //   alignment: Alignment.center,
                          //   clipBehavior: Clip.hardEdge,
                          //   margin: EdgeInsets.only(left: 10, right: 10),
                          //   height: MediaQuery.of(context).size.height / 30,
                          //   // padding: EdgeInsets.all(1),
                          //   width: MediaQuery.of(context).size.height / 30,
                          //   // clipBehavior: Clip.antiAlias,
                          //   decoration: BoxDecoration(
                          //     shape: BoxShape.circle,
                          //     gradient: LinearGradient(
                          //         colors: [lighAppColor, appColor],
                          //         begin: FractionalOffset.topCenter,
                          //         end: FractionalOffset.bottomCenter,
                          //         tileMode: TileMode.clamp),
                          //     color: Colors.white,
                          //   ),
                          //   child: Text(options,
                          //       style: TextStyle(
                          //           height: 1,
                          //           color: Color(0xFFFFFFFF),
                          //           fontSize: 18,
                          //           fontWeight: FontWeight.w500)),
                          // ),

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
          if (value.toString() != correctAnswer.toString()) {
            width = MediaQuery.of(context).size.width * .8;
            height = MediaQuery.of(context).size.height * .3;
            Provider.of<DataProvider>(context, listen: false).decrementCoin();
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
            print("question locked for 30 minutes");
            Alert(
              context: context,
              type: AlertType.error,
              title: "That's Wrong!\nTry it after 30 minutes.",
              style: AlertStyle(
                isCloseButton: false,
                isOverlayTapDismiss: false,
                titleStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
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
                        Provider.of<DataProvider>(context, listen: false)
                            .incrementCounter();
                        AppRoutes.push(
                            context,
                            HomePage(
                              levelIndex: widget.levelIndex,
                            ));

                        // User.userData.index = User.userData.index + 1;
                      });
                    })
              ],
            ).show();

            var cron = new Cron();
            cron.schedule(new Schedule.parse('*/30 * * * *'), () async {
              print('every three minutes');
              setState(() {
                Provider.of<DataProvider>(context, listen: false)
                    .decrementCoin();
              });
            });
          } else {
            Provider.of<DataProvider>(context, listen: false)
                .gameModel
                .levels[widget.levelIndex]
                .questions[widget.questionIndex]
                .correctlyAnswered = true;
            // Navigator.of(context).pop();
            setState(() {
              Provider.of<DataProvider>(context, listen: false)
                  .incrementCounter();
              AppRoutes.push(
                  context,
                  HomePage(
                    levelIndex: widget.levelIndex,
                  ));

              // User.userData.index = User.userData.index + 1;
            });
          }
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
