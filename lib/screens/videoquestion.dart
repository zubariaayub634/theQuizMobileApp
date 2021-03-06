import 'package:better_player/better_player.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:thequestion/screens/audioquestion.dart';
import 'package:thequestion/screens/homePage.dart';
import 'package:thequestion/screens/textquestion.dart';
import 'package:thequestion/utils/colors.dart';
import 'package:thequestion/utils/const.dart';
import 'package:thequestion/utils/routes.dart';
import 'package:thequestion/utils/styles.dart';
import 'package:thequestion/widgets/bottomnav.dart';
import 'package:thequestion/widgets/customappbar.dart';

class VideoQuestions extends StatefulWidget {
  String url;
  VideoQuestions({this.url});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _VideoQuestions();
  }
}

class _VideoQuestions extends State<VideoQuestions> {
  var width, height;

  BetterPlayerController _betterPlayerController;

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BetterPlayerDataSource betterPlayerDataSource =
        BetterPlayerDataSource(BetterPlayerDataSourceType.network, widget.url);
    _betterPlayerController = BetterPlayerController(
        BetterPlayerConfiguration(),
        betterPlayerDataSource: betterPlayerDataSource);
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Container(
      width: width,
      height: height * .33,
      child: Column(
        children: [
          SizedBox(
            height: height * .06,
          ),
          // _questionContainer(),
          // SizedBox(
          //   height: height * .02,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width * .7,
                height: height * .25,
                child: BetterPlayer(
                  controller: _betterPlayerController,
                ),
              ),
            ],
          ),
          // SizedBox(
          //   height: height * .02,
          // ),
          // _answerContainer("Cat", "a"),
          // _answerContainer("Dog", "b"),
          // _answerContainer("Deer", "c"),
          // _answerContainer("Lion", "d"),
          // _btnContainer(),
        ],
      ),
    );
  }

  Widget _questionContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          // color: Colors.black,
          margin: EdgeInsets.only(
            top: 10,
            left: 20,
            right: 20,
          ),
          // width: 200,
          child: Text(
            "What is the animal in video",
            style: boldTextStyle,
          ),
        ),
      ],
    );
  }

  Widget _answerContainer(String value, String options) {
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
                          Container(
                            alignment: Alignment.center,
                            clipBehavior: Clip.hardEdge,
                            margin: EdgeInsets.only(left: 10, right: 10),
                            height: MediaQuery.of(context).size.height / 30,
                            // padding: EdgeInsets.all(1),
                            width: MediaQuery.of(context).size.height / 30,
                            // clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                  colors: [lighAppColor, appColor],
                                  begin: FractionalOffset.topCenter,
                                  end: FractionalOffset.bottomCenter,
                                  tileMode: TileMode.clamp),
                              color: Colors.white,
                            ),
                            child: Text(options,
                                style: TextStyle(
                                    height: 1,
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500)),
                          ),
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
        // await _controller.reverse().then((value) => () {
        //       _controller.dispose();
        //     });
        if (value == "Cat") {
          constValues().noenoughCoinDialog(context);
          //HomePage.setLocalView(context, 2);
        } else if (value == "Dog") {
          AppRoutes.push(context, textquestion());
        } else {
          HomePage.setLocalView(context, 3);
        }
      },
    );
  }

  Widget _btnContainer() {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(top: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 13,
                decoration: BoxDecoration(
                    color: appColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )),
                child: Center(
                  child: Text(
                    "Next",
                    style: btnboldTextStyle,
                  ),
                )),
          ],
        ),
      ),
      onTap: () async {
        AppRoutes.push(context, AudioQuestion());
        // await _controller.reverse().then((value) => () {
        //       _controller.dispose();
        //     });
        // HomePage.setLocalView(context, 0);
        // _controller.forward();
      },
    );
  }
}
