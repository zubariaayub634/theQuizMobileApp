import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thequestion/localization/language_constants.dart';
import 'package:thequestion/routes/route_constants.dart';
import 'package:thequestion/utils/colors.dart';
import 'package:thequestion/utils/styles.dart';

class CreatePremiumAccount extends StatefulWidget {
  CreatePremiumAccount({Key key}) : super(key: key);

  @override
  _CreatePremiumAccountState createState() => _CreatePremiumAccountState();
}

class _CreatePremiumAccountState extends State<CreatePremiumAccount> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String mobile;
  String fullName;
  String cardNumber;
  String expirationDetail;
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Form(
                    key: _formKey,
                    child: Container(
                      margin: EdgeInsets.all(30),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.42,
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
                              Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: IconButton(
                                      icon: Icon(Icons.arrow_back),
                                      color: appColor,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 20, right: 20, top: 20),
                                          child: Text(
                                            "YaY",
                                            style: boldTextStyle,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 20, right: 20, top: 10),
                                          child: Text(
                                            "Create Premium Account",
                                            style: dimTextStyle,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                    ),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(1),
                                        labelText:
                                            getTranslated(context, 'fullName'),
                                        counterStyle: TextStyle(
                                            color: Colors.deepPurple[800]),
                                        labelStyle: TextStyle(color: dimBlack),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black26)),
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
                                              context, 'enter_fullName');
                                        }
                                        fullName = value;
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: 5,
                                      left: 20,
                                      right: 20,
                                    ),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(1),

                                        labelText: getTranslated(
                                            context, 'mobile_number'),
                                        counterStyle: TextStyle(
                                            color: Colors.deepPurple[800]),
                                        labelStyle: TextStyle(color: dimBlack),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black26)),
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
                                  Container(
                                    margin: EdgeInsets.only(top: 20, left: 20),
                                    child: Text(
                                      "Credit Card Details",
                                      style: boldTextStyle,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: 5,
                                      left: 20,
                                      right: 20,
                                    ),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(1),
                                        labelText: getTranslated(
                                            context, 'card_number'),
                                        hintText: "123 123 123 123",
                                        counterStyle: TextStyle(
                                            color: Colors.deepPurple[800]),
                                        labelStyle: TextStyle(color: dimBlack),
                                        hintStyle:
                                            TextStyle(color: lighAppColor),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black26)),
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
                                              context, 'required');
                                        }
                                        cardNumber = value;
                                        return null;
                                      },
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: 5,
                                          left: 20,
                                          right: 10,
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.89,
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            contentPadding: EdgeInsets.all(1),
                                            labelText: getTranslated(
                                                context, 'expiration_date'),
                                            hintText: "8/12",
                                            counterStyle: TextStyle(
                                                color: Colors.deepPurple[800]),
                                            labelStyle: TextStyle(
                                                color: dimBlack,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                            hintStyle:
                                                TextStyle(color: lighAppColor),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black26)),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: dimBlack)),
                                            border: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: dimBlack)),

                                            //  counter: Offstage()
                                          ),
                                          style: TextStyle(
                                            fontSize: 18.0,
                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return getTranslated(
                                                  context, 'required');
                                            }
                                            expirationDetail = value;
                                            return null;
                                          },
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: 5,
                                          right: 20,
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.89,
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            contentPadding: EdgeInsets.all(1),
                                            labelText: "CVC",
                                            hintText: "123",
                                            counterStyle: TextStyle(
                                                color: Colors.deepPurple[800]),
                                            labelStyle: TextStyle(
                                                color: dimBlack,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                            hintStyle:
                                                TextStyle(color: lighAppColor),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black26)),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: dimBlack)),
                                            border: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: dimBlack)),

                                            //  counter: Offstage()
                                          ),
                                          style: TextStyle(
                                            fontSize: 18.0,
                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return getTranslated(
                                                  context, 'required');
                                            }
                                            expirationDetail = value;
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  )
                                ],
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
        ],
      ),
    );
  }
}
