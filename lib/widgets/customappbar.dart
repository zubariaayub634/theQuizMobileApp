import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thequestion/Provider/dataprovider.dart';
import 'package:thequestion/screens/coinsScreen.dart';
import 'package:thequestion/utils/colors.dart';
import 'package:thequestion/utils/routes.dart';

class UpperBar extends StatefulWidget implements PreferredSizeWidget {
  final String barName;
  UpperBar({@required this.barName});

  @override
  _UpperBarState createState() => _UpperBarState();
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}

class _UpperBarState extends State<UpperBar>with SingleTickerProviderStateMixin {
  // var coins;
  var coins;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  // GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  initState(){
    super.initState();

    coins = Provider.of<DataProvider>(context, listen: false).getCoins;
  }


    // setState((){
    //   coins = Provider.of<DataProvider>(context, listen: false).coins;
    // });


  // @override
  // void dispose() {
  //   coins.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    setState(() {
      coins = Provider.of<DataProvider>(context, listen: false).getCoins;
    });

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: appColor,
        leading: InkWell(
            onTap: () {
              AppRoutes.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        centerTitle: true,
        title: Text(
          "${widget.barName}",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              AppRoutes.push(context, Coins());
            },
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 5.0, bottom: 0.0, right: 10.0),
                  child: Image.asset("assets/img/coin.png",
                      color: Colors.white,
                      width: width * .1,
                      // fit: BoxFit.cover,
                      height: height * 0.039),
                ),
                Row(
                  children: [
                    Text(
                      // "coins : " + coins.toString() + "   ",
                      "coins : ",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                       // "$coins",
                       "$coins",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "  ",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                    //                 _scaffoldKey.currentState.showSnackBar(
                    // SnackBar(content: ""));
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class UpperBar extends StatelessWidget implements PreferredSizeWidget {
//   UpperBar({@required this.barName});
//   final String barName;
//   var coins;
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     final width = MediaQuery.of(context).size.width;
//    final  height = MediaQuery.of(context).size.height;
//     coins = Provider.of<DataProvider>(context, listen: false).coins;
//     return AppBar(
//       backgroundColor: appColor,
//       leading: InkWell(
//           onTap: () {
//             AppRoutes.pop(context);
//           },
//           child: Icon(
//             Icons.arrow_back_ios,
//             color: Colors.white,
//           )),
//       centerTitle: true,
//       title: Text(
//         barName,
//         style: TextStyle(color: Colors.white, fontSize: 16),
//       ),
//       actions: [
//         GestureDetector(
//           onTap: (){
//             AppRoutes.push(context, Coins());
//           },
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 5.0,bottom: 0.0,right: 10.0),
//                 child: Image.asset(
//                     "assets/img/coin.png",
//                     color: Colors.white,
//                     width: width * .1,
//                     // fit: BoxFit.cover,
//                     height: height * 0.039),
//               ),
//               Row(
//                 children: [
//                   Text("coins : " + coins.toString() + "   ",style: TextStyle(fontWeight: FontWeight.w500),),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => Size.fromHeight(60);
// }
