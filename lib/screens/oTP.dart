
import 'package:flutter/material.dart';
import 'package:thequestion/localization/language_constants.dart';
import 'package:thequestion/routes/route_constants.dart';
import 'package:thequestion/utils/colors.dart';

class Otp extends StatefulWidget {
  Otp({Key key}) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var value1;
  var value2;
  var value3;
  var value4;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(left: 50, right: 50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              getTranslated(context, 'verification_code'),
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Text(
               getTranslated(context, 'otp_sent'),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  otpBoxBuilder("value1"),
                  otpBoxBuilder("value2"),
                  otpBoxBuilder("value3"),
                  otpBoxBuilder("value4")
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: InkWell(
                child: Text(
                 getTranslated(context, 'resend'),
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                      color: Colors.blue[200]),
                ),
                onTap: () {
                  //  Navigator.pushNamed(context, '/register');
                },
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 13.5,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 60),
             decoration: BoxDecoration(
                           color: appColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
              child: InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      getTranslated(context, 'submit'),
                      style: TextStyle(
                          fontSize: 16,
                          color: buttontxtColorWhite,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                onTap: (){
                  Navigator.pushNamed(context, homePageRoute);
                },
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget otpBoxBuilder(var variable) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height / 11,
      width: MediaQuery.of(context).size.width / 6.5,
      child: TextField(
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 23, color: Colors.black),
        onChanged: (value) {
          variable != 'value4' && value != ''
              ? FocusScope.of(context).nextFocus()
              : null;
          setState(() {
            variable = value;
          });
          print(variable);
        },
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          border: InputBorder.none,
          counterText: '',
        ),
        textAlign: TextAlign.center,
        cursorColor: Colors.grey,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: appColor, width: 3),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}
