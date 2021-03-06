// import 'dart:io';
//
// import 'package:admob_flutter/admob_flutter.dart';
// // import 'package:admob_flutter_example/extensions.dart';
// // import 'package:admob_flutter_example/new_page.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// // void main() {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   // Initialize without device test ids
// //   Admob.initialize();
// //
// //   // Add a list of test ids.
// //   // Admob.initialize(testDeviceIds: ['YOUR DEVICE ID']);
// //
// //   runApp(MyMaterialApp());
// // }
//
// class MyMaterialApp extends StatefulWidget {
//   @override
//   _MyMaterialAppState createState() => _MyMaterialAppState();
// }
//
// class _MyMaterialAppState extends State<MyMaterialApp> {
//   GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
//   AdmobBannerSize bannerSize;
//   AdmobInterstitial interstitialAd;
//   AdmobReward rewardAd;
//
//   @override
//   void initState() {
//     super.initState();
//     // You should execute `Admob.requestTrackingAuthorization()` here before showing any ad.
//     bannerSize = AdmobBannerSize.BANNER;
//
//     interstitialAd = AdmobInterstitial(
//       adUnitId: getInterstitialAdUnitId(),
//       listener: (AdmobAdEvent event, Map<String, dynamic> args) {
//         if (event == AdmobAdEvent.closed) interstitialAd.load();
//         handleEvent(event, args, 'Interstitial');
//       },
//     );
//
//     rewardAd = AdmobReward(
//       adUnitId: getRewardBasedVideoAdUnitId(),
//       listener: (AdmobAdEvent event, Map<String, dynamic> args) {
//         if (event == AdmobAdEvent.closed) rewardAd.load();
//         handleEvent(event, args, 'Reward');
//       },
//     );
//
//     interstitialAd.load();
//     rewardAd.load();
//   }
//
//   void handleEvent(
//       AdmobAdEvent event, Map<String, dynamic> args, String adType) {
//     switch (event) {
//       case AdmobAdEvent.loaded:
//         showSnackBar('New Admob $adType Ad loaded!');
//         break;
//       case AdmobAdEvent.opened:
//         showSnackBar('Admob $adType Ad opened!');
//         break;
//       case AdmobAdEvent.closed:
//         showSnackBar('Admob $adType Ad closed!');
//         break;
//       case AdmobAdEvent.failedToLoad:
//         showSnackBar('Admob $adType failed to load. :(');
//         break;
//       case AdmobAdEvent.rewarded:
//         showDialog(
//           context: scaffoldState.currentContext,
//           builder: (BuildContext context) {
//             return WillPopScope(
//               child: AlertDialog(
//                 content: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                     Text('Reward callback fired. Thanks Andrew!'),
//                     Text('Type: ${args['type']}'),
//                     Text('Amount: ${args['amount']}'),
//                   ],
//                 ),
//               ),
//               onWillPop: () async {
//                 scaffoldState.currentState.hideCurrentSnackBar();
//                 return true;
//               },
//             );
//           },
//         );
//         break;
//       default:
//     }
//   }
//
//   void showSnackBar(String content) {
//     scaffoldState.currentState.showSnackBar(
//       SnackBar(
//         content: Text(content),
//         duration: Duration(milliseconds: 1500),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blueGrey,
//       ),
//       home: Builder(
//         builder: (BuildContext context) => Scaffold(
//           key: scaffoldState,
//           appBar: AppBar(
//             title: const Text('AdmobFlutter'),
//             actions: [
//               FlatButton(
//                 onPressed: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       fullscreenDialog: true,
//                       builder: (BuildContext context) {
//                         // return NewPage(title: 'Full Screen Dialog');
//                       },
//                     ),
//                   );
//                 },
//                 child: Text(
//                   'FullscreenDialog',
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 ),
//               )
//             ],
//           ), // .withBottomAdmobBanner(context),
//           bottomNavigationBar: Builder(
//             builder: (BuildContext context) {
//               return Container(
//                 color: Colors.blueGrey,
//                 child: SafeArea(
//                   child: SizedBox(
//                     height: 60,
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Expanded(
//                           child: FlatButton(
//                             child: Text(
//                               'Show Interstitial',
//                               style: TextStyle(color: Colors.white),
//                             ),
//                             onPressed: () async {
//                               if (await interstitialAd.isLoaded) {
//                                 interstitialAd.show();
//                               } else {
//                                 showSnackBar(
//                                     'Interstitial ad is still loading...');
//                               }
//                             },
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.zero,
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: FlatButton(
//                             child: Text(
//                               'Show Reward',
//                               style: TextStyle(color: Colors.white),
//                             ),
//                             onPressed: () async {
//                               if (await rewardAd.isLoaded) {
//                                 rewardAd.show();
//                               } else {
//                                 showSnackBar('Reward ad is still loading...');
//                               }
//                             },
//                           ),
//                         ),
//                         Expanded(
//                           child: PopupMenuButton(
//                             initialValue: bannerSize,
//                             child: Center(
//                               child: Text(
//                                 'Banner size',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.white),
//                               ),
//                             ),
//                             offset: Offset(0, 20),
//                             onSelected: (AdmobBannerSize newSize) {
//                               setState(() {
//                                 bannerSize = newSize;
//                               });
//                             },
//                             itemBuilder: (BuildContext context) =>
//                             <PopupMenuEntry<AdmobBannerSize>>[
//                               PopupMenuItem(
//                                 value: AdmobBannerSize.BANNER,
//                                 child: Text('BANNER'),
//                               ),
//                               PopupMenuItem(
//                                 value: AdmobBannerSize.LARGE_BANNER,
//                                 child: Text('LARGE_BANNER'),
//                               ),
//                               PopupMenuItem(
//                                 value: AdmobBannerSize.MEDIUM_RECTANGLE,
//                                 child: Text('MEDIUM_RECTANGLE'),
//                               ),
//                               PopupMenuItem(
//                                 value: AdmobBannerSize.FULL_BANNER,
//                                 child: Text('FULL_BANNER'),
//                               ),
//                               PopupMenuItem(
//                                 value: AdmobBannerSize.LEADERBOARD,
//                                 child: Text('LEADERBOARD'),
//                               ),
//                               PopupMenuItem(
//                                 value: AdmobBannerSize.SMART_BANNER(context),
//                                 child: Text('SMART_BANNER'),
//                               ),
//                               PopupMenuItem(
//                                 value: AdmobBannerSize.ADAPTIVE_BANNER(
//                                   width: MediaQuery.of(context)
//                                       .size
//                                       .width
//                                       .toInt() -
//                                       40, // considering EdgeInsets.all(20.0)
//                                 ),
//                                 child: Text('ADAPTIVE_BANNER'),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           child: FlatButton(
//                             child: Text(
//                               'Push Page',
//                               style: TextStyle(color: Colors.white),
//                             ),
//                             onPressed: () {
//                               // Navigator.of(context).push(
//                               //   MaterialPageRoute(
//                               //       builder: (BuildContext context) {
//                               //         return NewPage(
//                               //           title: 'Push Page',
//                               //         );
//                               //       }),
//
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//           body: Column(
//             children: [
//               Expanded(
//                 child: Scrollbar(
//                   child: ListView.builder(
//                     padding: EdgeInsets.all(20.0),
//                     itemCount: 1000,
//                     itemBuilder: (BuildContext context, int index) {
//                       if (index != 0 && index % 6 == 0) {
//                         return Column(
//                           children: <Widget>[
//                             // Container(
//                             //   margin: EdgeInsets.only(bottom: 20.0),
//                             //   child: AdmobBanner(
//                             //     adUnitId: getBannerAdUnitId(),
//                             //     adSize: bannerSize,
//                             //     listener: (AdmobAdEvent event,
//                             //         Map<String, dynamic> args) {
//                             //       handleEvent(event, args, 'Banner');
//                             //     },
//                             //     onBannerCreated:
//                             //         (AdmobBannerController controller) {
//                             //       // Dispose is called automatically for you when Flutter removes the banner from the widget tree.
//                             //       // Normally you don't need to worry about disposing this yourself, it's handled.
//                             //       // If you need direct access to dispose, this is your guy!
//                             //       // controller.dispose();
//                             //     },
//                             //   ),
//                             // ),
//                             Container(
//                               height: 100.0,
//                               margin: EdgeInsets.only(bottom: 20.0),
//                               color: Colors.cyan,
//                             ),
//                           ],
//                         );
//                       }
//                       return Container(
//                         height: 100.0,
//                         margin: EdgeInsets.only(bottom: 20.0),
//                         color: Colors.cyan,
//                       );
//                     },
//                   ),
//                 ),
//               ),
//               // Another option is to fix a banner ad to the top or bottom of your content.
//               // Notice that banners are not scrolling, which is a violation of admob policy.
//               //
//               // See: https://github.com/kmcgill88/admob_flutter/issues/194
//               // "banner ads should not move as a user scrolls, as users may try to
//               // click on the menu but end up clicking on the ad accidentally instead.
//               // This specific implementation is against policy and we reserve the right
//               // to disable ad serving to your app."
//
//               // Builder(
//               //   builder: (BuildContext context) {
//               //     final size = MediaQuery.of(context).size;
//               //     final height = max(size.height * .05, 50.0);
//               //     return Container(
//               //       width: size.width,
//               //       height: height,
//               //       child: AdmobBanner(
//               //         adUnitId: getBannerAdUnitId(),
//               //         adSize: AdmobBannerSize.ADAPTIVE_BANNER(
//               //           width: size.width.toInt(),
//               //         ),
//               //         listener: (AdmobAdEvent event, Map<String, dynamic> args) {
//               //           handleEvent(event, args, 'Banner');
//               //         },
//               //       ),
//               //     );
//               //   },
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//     // .withBottomAdmobBanner(context);
//   }
//
//   @override
//   void dispose() {
//     interstitialAd.dispose();
//     rewardAd.dispose();
//     super.dispose();
//   }
// }
//
// /*
// Test Id's from:
// https://developers.google.com/admob/ios/banner
// https://developers.google.com/admob/android/banner
//
// App Id - See README where these Id's go
// Android: ca-app-pub-3940256099942544~3347511713
// iOS: ca-app-pub-3940256099942544~1458002511
//
// Banner
// Android: ca-app-pub-3940256099942544/6300978111
// iOS: ca-app-pub-3940256099942544/2934735716
//
// Interstitial
// Android: ca-app-pub-3940256099942544/1033173712
// iOS: ca-app-pub-3940256099942544/4411468910
//
// Reward Video
// Android: ca-app-pub-3940256099942544/5224354917
// iOS: ca-app-pub-3940256099942544/1712485313
// */
//
// // String getBannerAdUnitId() {
// //   if (Platform.isIOS) {
// //     return 'ca-app-pub-3940256099942544/2934735716';
// //   } else if (Platform.isAndroid) {
// //     return 'ca-app-pub-3940256099942544/6300978111';
// //   }
// //   return null;
// // }
// //
// String getInterstitialAdUnitId() {
//   if (Platform.isIOS) {
//     return 'ca-app-pub-3940256099942544/4411468910';
//   } else if (Platform.isAndroid) {
//     return 'ca-app-pub-3940256099942544/1033173712';
//   }
//   return null;
// }
//
// String getRewardBasedVideoAdUnitId() {
//   if (Platform.isIOS) {
//     return 'ca-app-pub-3940256099942544/1712485313';
//   } else if (Platform.isAndroid) {
//     return 'ca-app-pub-3940256099942544/5224354917';
//   }
//   return null;
// }
//
// //
// // import 'package:admob_flutter/admob_flutter.dart';
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'package:thequestion/screens/homePage.dart';
// // import 'package:thequestion/screens/playscreen.dart';
// // import 'package:thequestion/utils/colors.dart';
// // import 'package:thequestion/utils/const.dart';
// // import 'package:thequestion/utils/routes.dart';
// // import 'package:thequestion/utils/styles.dart';
// //
// // import 'Provider/dataprovider.dart';
// // import 'models/questionmodel.dart';
// //
// // class Testtsts extends StatefulWidget {
// //   List<Questions> questions;
// //   int index;
// //   Testtsts({this.questions, this.index});
// //   @override
// //   _TesttstsState createState() => _TesttstsState();
// // }
// //
// // class _TesttstsState extends State<Testtsts> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return          Expanded(
// //         child: ListView.builder(
// //           itemBuilder: (context, int index) {
// //             return _answerContainer(
// //                 widget.questions[widget.index].options[index].optionName
// //                     .toString(),
// //                 index,
// //                 widget.questions[widget.index].correctAnswer);
// //           },
// //           itemCount: widget.questions[widget.index].options.length,
// //         ));
// //   }
// //
// //   Widget _answerContainer(String value, int index, var correctAnswer) {
// //     return InkWell(
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           Container(
// //             margin: EdgeInsets.only(top: 20),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.start,
// //               children: [
// //                 Container(
// //                     padding: EdgeInsets.all(10),
// //                     constraints: BoxConstraints(
// //                       minWidth: MediaQuery.of(context).size.width / 1.7,
// //                       minHeight: MediaQuery.of(context).size.height / 15,
// //                       // maxWidth: MediaQuery.of(context).size.width/1.1
// //                     ),
// //                     decoration: BoxDecoration(
// //                         color: appColor,
// //                         borderRadius: BorderRadius.only(
// //                             topRight: Radius.circular(10),
// //                             bottomRight: Radius.circular(10),
// //                             topLeft: Radius.circular(10),
// //                             bottomLeft: Radius.circular(10))),
// //                     child: Container(
// //                       child: Row(
// //                         // mainAxisAlignment: MainAxisAlignment.start,
// //                         children: [
// //                           // Container(
// //                           //   alignment: Alignment.center,
// //                           //   clipBehavior: Clip.hardEdge,
// //                           //   margin: EdgeInsets.only(left: 10, right: 10),
// //                           //   height: MediaQuery.of(context).size.height / 30,
// //                           //   // padding: EdgeInsets.all(1),
// //                           //   width: MediaQuery.of(context).size.height / 30,
// //                           //   // clipBehavior: Clip.antiAlias,
// //                           //   decoration: BoxDecoration(
// //                           //     shape: BoxShape.circle,
// //                           //     gradient: LinearGradient(
// //                           //         colors: [lighAppColor, appColor],
// //                           //         begin: FractionalOffset.topCenter,
// //                           //         end: FractionalOffset.bottomCenter,
// //                           //         tileMode: TileMode.clamp),
// //                           //     color: Colors.white,
// //                           //   ),
// //                           //   child: Text(options,
// //                           //       style: TextStyle(
// //                           //           height: 1,
// //                           //           color: Color(0xFFFFFFFF),
// //                           //           fontSize: 18,
// //                           //           fontWeight: FontWeight.w500)),
// //                           // ),
// //
// //                           Container(
// //                             constraints: BoxConstraints(
// //                               maxWidth: MediaQuery.of(context).size.width / 1.5,
// //                             ),
// //                             child: Text(
// //                               value,
// //                               style: TextStyle(
// //                                   color: Colors.white,
// //                                   fontSize: 18,
// //                                   fontWeight: FontWeight.w400),
// //                             ),
// //                           )
// //                         ],
// //                       ),
// //                     )),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //       onTap: () async {
// //         if (widget.index == (widget.questions.length - 1)) {
// //           Provider.of<DataProvider>(context, listen: false).setCounterZero();
// //           AppRoutes.makeFirst(context, PlayScreen());
// //         } else {
// //           if (value.toString() != correctAnswer.toString()) {
// //             constValues().wrongAnswerDialog(context);
// //           } else {
// //             // Navigator.of(context).pop();
// //             setState(() {
// //               Provider.of<DataProvider>(context, listen: false)
// //                   .incrementCounter();
// //               AppRoutes.push(
// //                   context,
// //                   HomePage(
// //                     questions: widget.questions,
// //                   ));
// //               // User.userData.index = User.userData.index + 1;
// //             });
// //           }
// //         }
// //         if (widget.index == (widget.questions.length - 4) ) {
// //           // await interstitialAd.load();
// //           // interstitialAd.show();
// //         } else {
// //           // showSnackBar(
// //           //     'Interstitial ad is still loading...');
// //         }
// //
// //         // await _controller.reverse().then((value) => () {
// //         //       _controller.dispose();
// //         //     });
// //         // if (value == "Doha") {
// //         //   HomePage.setLocalView(context, 2);
// //         // } else {
// //         //   HomePage.setLocalView(context, 3);
// //         // }
// //       },
// //     );
// //   }
// //
// //   Widget _questionContainer(String text) {
// //     return Padding(
// //       padding: EdgeInsets.only(left: 10,top: 10.0, right: 10),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           Flexible(
// //             child: Text(
// //               text.toString(),
// //               textAlign: TextAlign.center,
// //               maxLines: 3,
// //               style: boldTextStyle,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
