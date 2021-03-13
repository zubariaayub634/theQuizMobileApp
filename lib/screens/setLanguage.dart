import 'package:flutter/material.dart';
import 'package:thequestion/localization/language_constants.dart';
import 'package:thequestion/routes/route_constants.dart';
import 'package:thequestion/utils/colors.dart';

import '../main.dart';

class SetLanguage extends StatefulWidget {
  SetLanguage({Key key}) : super(key: key);

  @override
  _SetLanguageState createState() => _SetLanguageState();
}

class _SetLanguageState extends State<SetLanguage> {
  int lang = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 50, right: 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              lang == 1
                  ? cutomButton("english", true)
                  : cutomButton("english", false),
              lang == 2
                  ? cutomButton("arabic", true)
                  : cutomButton("arabic", false),
            ],
          ),
        ),
      ),
    );
  }

  Widget cutomButton(String value, bool status) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height / 11,
        width: MediaQuery.of(context).size.width,
        child: Text(
          getTranslated(context, value),
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: status ? Colors.white : appColor,
          ),
        ),
        decoration: BoxDecoration(
          color: status ? appColor : Colors.white,
          //  border: Border.all(color: status? appColor:Colors.black38, width: 3),
          boxShadow: status
              ? [
                  BoxShadow(
                    color: appColor.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 5,
                    //  offset: Offset(0, 0),
                  )
                ]
              : [
                  BoxShadow(
                    color: appColor.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    //  offset: Offset(0, 0),
                  )
                ],
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      onTap: () {
        if (value == "english" && !status)
          setState(() {
            lang = 1;
            _changeLanguage('en');
          });
        else if (value == "arabic" && !status)
          setState(() {
            lang = 2;
            _changeLanguage('ar');
          });
        else if (value == "english" && status)
          setState(() {
            lang = 1;
            _changeLanguage('en');
          });
        Navigator.pushNamed(context, signInRoute);
      },
    );
  }

  void _changeLanguage(String language) async {
    Locale _locale = await setLocale(language);
    MyApp.setLocale(context, _locale);
  }
}
