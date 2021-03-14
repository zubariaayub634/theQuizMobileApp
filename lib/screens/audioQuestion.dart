import 'package:audioplayerui/audioplayerui.dart';
import 'package:chewie_audio/chewie_audio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:thequestion/Provider/dataProvider.dart';
import 'package:thequestion/screens/homePage.dart';
import 'package:thequestion/utils/colors.dart';
import 'package:thequestion/utils/styles.dart';

class AudioQuestion extends StatefulWidget {
  final String url;
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
}
