import 'dart:io';

// String getAppId() {
//   if (Platform.isIOS) {
//     return 'ca-app-pub-3940256099942544~1458002511';
//   } else if (Platform.isAndroid) {
//     return 'ca-app-pub-3940256099942544~3347511713';
//   }
//   return null;
// }
// String getBannerAdUnitId() {
//   if (Platform.isIOS) {
//     return 'ca-app-pub-3940256099942544/2934735716';
//   } else if (Platform.isAndroid) {
//     return 'ca-app-pub-3940256099942544/6300978111';
//   }
//   return null;
// }

String getAppTestId() {
  if (Platform.isIOS) {
    return 'ca-app-pub-3940256099942544/4411468910';
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-3940256099942544/1033173712';
  }
  return null;
}

String getInterstitialAdUnitId() {
  if (Platform.isIOS) {
    return 'ca-app-pub-3940256099942544/4411468910';
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-3940256099942544/1033173712';
  }
  return null;
}

String getRewardBasedVideoAdUnitId() {
  if (Platform.isIOS) {
    return 'ca-app-pub-3940256099942544/1712485313';
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-3940256099942544/5224354917';
  }
  return null;
}

// class MyBanner extends StatelessWidget{
//   var size;
//   MyBanner(this.size);
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
//         child: ClipRRect( // rounded corners ad.
//           //borderRadius: BorderRadius.circular(40.0),
//           child: AdmobBanner(
//             adUnitId: getBannerAdUnitId(),
//             adSize: size
//           ),
//         ),
//       );
//   }
//
// }

// class MyInterstitial extends StatelessWidget{
//     var size;
//     MyInterstitial(this.size);
//     @override
//     Widget build(BuildContext context) {
//       return AdmobInterstitial(
//          adUnitId: getInterstitialAdUnitId(),
//         listener: (Mobi){};
//
//       );
//     }
//
//   }
