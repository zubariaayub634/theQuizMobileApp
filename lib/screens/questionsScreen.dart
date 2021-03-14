import 'package:admob_flutter/admob_flutter.dart';
import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:thequestion/Provider/dataprovider.dart';
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
  final List<Question> questions;
  final int index;
  QuestionsScreen({this.questions, this.index});

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
          widget.questions[widget.index].type == 0
              ? _questionContainer(
                  widget.questions[widget.index].question.toString())
              : widget.questions[widget.index].type == 1
                  ? Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * .05),
                        _questionContainer(
                            widget.questions[widget.index].question.toString()),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * .33,
                          child: VideoQuestions(
                            url: widget.questions[widget.index].url,
                          ),
                        ),
                      ],
                    )
                  : widget.questions[widget.index].type == 3
                      ? Column(
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .008),
                            _questionContainer(widget
                                .questions[widget.index].question
                                .toString()),
                            AudioQuestion(
                              url: widget.questions[widget.index].url,
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
                                  image: NetworkImage(
                                      widget.questions[widget.index].url),
                                  fit: BoxFit.fill,
                                ))),
                            _questionContainer(
                              widget.questions[widget.index].question
                                  .toString(),
                            ),
                          ],
                        ),

          Expanded(
              child: ListView.builder(
            itemBuilder: (context, int index) {
              return _answerContainer(
                widget.questions[widget.index].options[index].optionName
                    .toString(),
                index,
                widget.questions[widget.index].correctAnswer,
              );
            },
            itemCount: widget.questions[widget.index].options.length,
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
        if (widget.index == (widget.questions.length - 1)) {
          // Provider.of<DataProvider>(context, listen: false).setCounterZero();
          AppRoutes.makeFirst(context, PlayScreen());
        } else {
          if (value.toString() != correctAnswer.toString()) {
            width = MediaQuery.of(context).size.width * .8;
            height = MediaQuery.of(context).size.height * .3;
            Provider.of<DataProvider>(context, listen: false).decrementCoin();

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
                              questions: widget.questions,
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
            // Navigator.of(context).pop();
            setState(() {
              Provider.of<DataProvider>(context, listen: false)
                  .incrementCounter();
              AppRoutes.push(
                  context,
                  HomePage(
                    questions: widget.questions,
                  ));

              // User.userData.index = User.userData.index + 1;
            });
          }
        }
        if (widget.index == (widget.questions.length - 4)) {
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
