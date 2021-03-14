import 'package:flutter/material.dart';
import 'package:thequestion/utils/const.dart';
import 'package:provider/provider.dart';
import 'package:thequestion/Provider/dataProvider.dart';

class BottomNavigation extends StatelessWidget {
  final String hint;

  BottomNavigation({this.hint});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .08,
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
                onTap: () {
                  Provider.of<DataProvider>(context, listen: false).deductCoins(5);
                  ConstValues().hintDialog(context, hint);
                },
                child: Icon(
                  Icons.lightbulb_outline_rounded,
                  size: 40,
                  color: Colors.yellow,
                ))
          ],
        ));
  }
}
