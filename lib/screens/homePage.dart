import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thequestion/Provider/dataprovider.dart';
import 'package:thequestion/localization/language_constants.dart';
import 'package:thequestion/screens/OfferingVendors.dart';
import 'package:thequestion/screens/questionsScreen.dart';
import 'package:thequestion/screens/SubmitAnswer.dart';
import 'package:thequestion/screens/vendorOffers.dart';
import 'package:thequestion/screens/resultScreen.dart';
import 'package:thequestion/utils/colors.dart';
import 'package:thequestion/utils/routes.dart';
import 'package:thequestion/widgets/bottomnav.dart';
import 'package:thequestion/widgets/noenoughcoins.dart';
import 'coinsscreen.dart';

class HomePage extends StatefulWidget {
  final int levelIndex;
  HomePage({
    this.levelIndex,
  });

  static void setLocalView(BuildContext context, int value) {
    _HomePageState state = context.findAncestorStateOfType<_HomePageState>();
    state.setView(value);
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String language;
  int view = 0;
  setView(value) {
    setState(() {
      view = value;
    });
  }

  // @override
  // void initState() {
  //   //setlanguage();
  //   // TODO: implement initState
  //   super.initState();
  // }
  var width;
  var height;
  var coins;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    coins = Provider.of<DataProvider>(context, listen: false).getCoins;
    int index = Provider.of<DataProvider>(context, listen: false).currentIndex %
        Provider.of<DataProvider>(context, listen: false)
            .gameModel
            .levels[widget.levelIndex]
            .questions
            .length;

    print("current index" + index.toString());
    print("pending coins: " + coins.toString());

    return Scaffold(
      bottomNavigationBar: coins == 0
          ? NotEnoughCoins()
          : BottomNavigation(
              hint: Provider.of<DataProvider>(context, listen: false)
                  .gameModel
                  .levels[widget.levelIndex]
                  .questions[index]
                  .correctAnswer,
            ),
      // appBar: UpperBar(
      //   barName: "Questions",
      // ),

      appBar: AppBar(
        backgroundColor: appColor,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        // leading: BackButton(
        //   onPressed: (){
        //     AppRoutes.push(context, Levels());
        //   },
        // ),
        centerTitle: true,
        title: Text(
          "Question",
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
      body: view == 0
          ? Center(
              child: QuestionsScreen(
                questionIndex: index,
                levelIndex: widget.levelIndex,
              ),
            )
          : view == 1
              ? SubmitAnswer()
              : view == 2
                  ? ResultScreen(
                      correct: true,
                    )
                  : view == 3
                      ? ResultScreen(
                          correct: false,
                        )
                      : view == 5
                          ? OfferingVendors()
                          : view == 6
                              ? VendorOffers()
                              : null,
      // drawer: Drawer(
      //   child: _drawerList(),
      // ),
    );
  }

  Container _drawerList() {
    return Container(
      color: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(color: lighAppColor),
            padding: EdgeInsets.zero,
            child: Center(
              //  height: 20,
              child: Column(
                //  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/img/appLogo.png'),
                    height: MediaQuery.of(context).size.height * .2,
                    width: MediaQuery.of(context).size.height / 3,
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home_outlined,
              color: drawerItemColors,
              //  size: 30,
            ),
            title: Text(
              getTranslated(context, 'home'),
              style: TextStyle(
                color: drawerItemColors,
                fontSize: 16,
              ),
            ),
            onTap: () {
              // To close the Drawer
              Navigator.pop(context);
              setView(0);
              // Navigating to About Page
              //    Navigator.pushNamed(context, aboutRoute);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.account_circle_outlined,
              color: drawerItemColors,
              //  size: 30,
            ),
            title: Text(
              getTranslated(context, 'profile'),
              style: TextStyle(
                color: drawerItemColors,
                fontSize: 16,
              ),
            ),
            onTap: () {
              // To close the Drawer
              Navigator.pop(context);
              // Navigating to About Page
              //    Navigator.pushNamed(context, aboutRoute);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.local_offer_outlined,
              color: drawerItemColors,

              //   size: 30,
            ),
            title: Text(
              getTranslated(context, 'offers'),
              style: TextStyle(
                color: drawerItemColors,
                fontSize: 16,
              ),
            ),
            onTap: () {
              // To close the Drawer
              Navigator.pop(context);
              //setView(5);
              // Navigating to About Page
              //    Navigator.pushNamed(context, settingsRoute);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.share_outlined,
              color: drawerItemColors,
              //  size: 30,
            ),
            title: Text(
              getTranslated(context, 'share_with_others'),
              style: TextStyle(
                color: drawerItemColors,
                fontSize: 16,
              ),
            ),
            onTap: () {
              // To close the Drawer
              Navigator.pop(context);
              // Navigating to About Page
              //    Navigator.pushNamed(context, settingsRoute);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.text_snippet_outlined,
              color: drawerItemColors,
              // size: 30,
            ),
            title: Text(
              getTranslated(context, 'terms_and_conditions'),
              style: TextStyle(
                color: drawerItemColors,
                fontSize: 16,
              ),
            ),
            onTap: () {
              // To close the Drawer
              Navigator.pop(context);
              // Navigating to About Page
              //    Navigator.pushNamed(context, settingsRoute);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.contact_support_sharp,
              color: drawerItemColors,
            ),
            title: Text(
              getTranslated(context, 'about_us'),
              style: TextStyle(
                color: drawerItemColors,
                fontSize: 16,
              ),
            ),
            onTap: () {
              // To close the Drawer
              Navigator.pop(context);
              // Navigating to About Page
              //    Navigator.pushNamed(context, settingsRoute);
            },
          ),
          // ListTile(
          //   leading: Icon(
          //     Icons.language,
          //     color: drawerItemColors,
          //     //  size: 30,
          //   ),
          //   title: Text(
          //     language == "en"
          //         ? getTranslated(context, "arabic")
          //         : language == "ar"
          //             ? getTranslated(context, "english")
          //             : "Language",
          //     style: TextStyle(
          //       color: drawerItemColors,
          //       fontSize: 16,
          //     ),
          //   ),
          //   onTap: () {
          //     _saveLanguage();
          //     // To close the Drawer
          //     //  Navigator.pop(context);
          //     // Navigating to About Page
          //     //    Navigator.pushNamed(context, settingsRoute);
          //   },
          // ),

          ListTile(
            leading: Icon(Icons.logout, color: drawerItemColors
                //  size: 30,
                ),
            title: Text(
              getTranslated(context, 'log_out'),
              style: TextStyle(
                color: drawerItemColors,
                fontSize: 16,
              ),
            ),
            onTap: () {
              // To close the Drawer
              Navigator.pop(context);
              // Navigating to About Page
              //    Navigator.pushNamed(context, settingsRoute);
            },
          ),
        ],
      ),
    );
  }
}
