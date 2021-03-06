import 'package:flutter/material.dart';
import 'package:thequestion/models/Vendors.dart';
import 'package:thequestion/screens/homePage.dart';
import 'package:thequestion/utils/colors.dart';

class OfferingVendors extends StatefulWidget {
  OfferingVendors({Key key}) : super(key: key);

  @override
  _OfferingVendorsState createState() => _OfferingVendorsState();
}

class _OfferingVendorsState extends State<OfferingVendors> {
  List<Vendors> _vendorsList = [
    Vendors("Al Fateh", "assets/img/haier.png"),
    Vendors("Afzal Electronics", "assets/img/haier.png"),
    Vendors(
      "Jalal Sons",
      "assets/img/haier.png",
    ),
    Vendors("Rainbow", "assets/img/haier.png"),
    Vendors("My Dawlence", "assets/img/haier.png"),
    Vendors("City Electronics", "assets/img/haier.png"),
    Vendors("TownShip", "assets/img/haier.png"),
    Vendors("Doha Electronics", "assets/img/haier.png"),
    Vendors("International Electronics", "assets/img/haier.png"),
    Vendors("Bamsi Electronics", "assets/img/haier.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              //  mainAxisSpacing: 8,
              childAspectRatio: 0.7),
          itemCount: _vendorsList.length,
          itemBuilder: (context, index) {
            return InkWell(
              child: Container(
                height: MediaQuery.of(context).size.height / 4.7,
                margin: EdgeInsets.only(bottom: 20),
                // padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: appColor, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  boxShadow: [
                    BoxShadow(
                      color: lighAppColor.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      //  offset: Offset(0, 0),
                    )
                  ],
                  color: Colors.white,
                ),
                //  height: 150,
                child: Stack(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(bottom: 32),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Image(
                            image:
                                AssetImage(_vendorsList[index].vendorImagePath),
                          ),
                        )),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: appColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10))),
                          height: MediaQuery.of(context).size.height / 18,
                          child: Container(
                            // margin: EdgeInsets.only(bottom: 5),
                            alignment: Alignment.center,
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width / 4,
                            ),
                            child: Text(
                              _vendorsList[index].vendorName,
                              maxLines: 1,
                              style: TextStyle(
                                  color: txtColorWhite,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              onTap: () {
                HomePage.setLocalView(context, 6);
                // widget.page == "home"
                //     ? null
                //     : Navigator.pushNamed(
                //         context,
                //         maintenanceDetailPageRoute,
                //         arguments: _demoimagelist[index],
                //       );
              },
            );
          }),
    );
  }
}
