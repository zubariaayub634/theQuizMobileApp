import 'package:audioplayerui/audioplayerui.dart';
import 'package:chewie_audio/chewie_audio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:thequestion/Provider/dataprovider.dart';
import 'package:thequestion/screens/homePage.dart';
import 'package:thequestion/utils/colors.dart';
import 'package:thequestion/utils/const.dart';
import 'package:thequestion/utils/routes.dart';
import 'package:thequestion/utils/styles.dart';
import 'package:thequestion/widgets/customappbar.dart';

class AudioQuestion extends StatefulWidget {
  String url;
  AudioQuestion({this.url});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AudioQuestion();
  }
}

class _AudioQuestion extends State<AudioQuestion> {
  var width, height;
  var coins;

  AudioPlayerController audioPlayerController = AudioPlayerController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    audioPlayerController.audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    ChewieAudioController _chewieAudioController;

    // TODO: implement build
    return Container(
        width: width * .8,
        height: height * .25,
        child: AudioPlayerView(
          audioPlayerController: audioPlayerController,
          trackTitle: "test",
          trackUrl: widget.url,
          simpleDesign: false,
        ));
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
        if (value == "Doha") {
          HomePage.setLocalView(context, 2);
        } else {
          HomePage.setLocalView(context, 3);
        }
      },
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
            "What is the voice in Audio",
            textAlign: TextAlign.center,
            style: boldTextStyle,
          ),
        ),
      ],
    );
  }

  Widget _btnContainer() {
    coins = Provider.of<DataProvider>(context, listen: false).decrementCoin;
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
        width = MediaQuery.of(context).size.width * .8;
        height = MediaQuery.of(context).size.height * .3;
        coins = Provider.of<DataProvider>(context, listen: false).decrementCoin;

        Alert(
          context: context,
          type: AlertType.error,
          title: "That's Wrong!\nTry it after 30 minutes.",
          style: AlertStyle(
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
                  Navigator.pop(context);
                })
          ],
        ).show();
        setState(() {
          Provider.of<DataProvider>(context, listen: false).decrementCoin;
        });
        // AppRoutes.push(context, AudioQuestion());
        // await _controller.reverse().then((value) => () {
        //       _controller.dispose();
        //     });
        // HomePage.setLocalView(context, 0);
        // _controller.forward();
      },
    );
  }
}
