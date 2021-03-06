import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thequestion/localization/language_constants.dart';
import 'package:thequestion/routes/route_constants.dart';
import 'package:thequestion/utils/colors.dart';
import 'package:thequestion/utils/styles.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  String mobile;
  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.loose,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.2,
              decoration: BoxDecoration(color: lighAppColor),
              child: Wrap(
                  //  height: MediaQuery.of(context).size.height / 4,
                  //   width: MediaQuery.of(context).size.width / 5,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        //  alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.width / 2,
                        child: Image(
                          image: AssetImage("assets/img/appLogo.png"),
                        ),
                      ),
                    )
                  ]),
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: _formKey,
                    child: Container(
                      margin: EdgeInsets.all(30),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: lighAppColor.withOpacity(1),
                            spreadRadius: 2,
                            blurRadius: 5,
                            //  offset: Offset(0, 0),
                          )
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 20, right: 20, top: 20),
                                    child: Text(
                                      "WoW",
                                      style: boldTextStyle,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 20, right: 20, top: 10),
                                    child: Text(
                                      "First party Authentication",
                                      style: dimTextStyle,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 20, right: 20, top: 10),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    isDense: true,

                                    labelText:
                                        getTranslated(context, 'mobile_number'),
                                    counterStyle: TextStyle(
                                        color: Colors.deepPurple[800]),
                                    labelStyle: TextStyle(color: dimBlack),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black26)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: dimBlack)),
                                    border: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: dimBlack)),

                                    //  counter: Offstage()
                                  ),
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return getTranslated(
                                          context, 'enter_mob');
                                    }
                                    mobile = value;
                                    return null;
                                  },
                                ),
                              ),
                              InkWell(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height / 10,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                      color: appColor),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(getTranslated(context, "getOTP"),
                                            style: btnboldTextStyle),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Icon(
                                            Icons.arrow_forward,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  if (_formKey.currentState.validate()) {
                                    // _addComplain();
                                    // _register();
                                  }
                                  Navigator.pushNamed(context, oTPRoute);
                                },
                              ),
                            ],
                          )),
                    ),
                  )
                ],
              )),
          Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 30, right: 30, bottom: 40),
                    height: MediaQuery.of(context).size.height / 12,
                    decoration: BoxDecoration(
                      color: appColor,
                      boxShadow: [
                        BoxShadow(
                          color: lighAppColor.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          //  offset: Offset(0, 0),
                        )
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Center(
                      child: Text(
                        "Get Premium Account",
                        style: btnboldTextStyle,
                      ),
                    )),
                onTap: () {
                  Navigator.pushNamed(context, premiumAccountPageRoute);
                },
              ))
        ],
      ),
    );
  }
}
