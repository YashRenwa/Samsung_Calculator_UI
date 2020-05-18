import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:samsungcalculatorclone/conversiontabactivity.dart';

class UnitsConversion extends StatefulWidget {
  @override
  _UnitsConversionState createState() => _UnitsConversionState();
}

class _UnitsConversionState extends State<UnitsConversion> {
  Widget button(String symbol, double buttonHeight, Color textColor,
      Color bgColor, String name) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.098 * buttonHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35.0),
        color: Colors.black,
      ),
      child: GestureDetector(
        child: InkWell(
          child: RaisedButton(
            padding: EdgeInsets.all(16.0),
            child: Text(
              symbol,
              style: TextStyle(
                color: textColor,
                fontSize: 30.0,
              ),
            ),
            color: bgColor,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.black,
                width: 7,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(35.0),
            ),
            onLongPress: () {
              if (name != null) {
                HapticFeedback.vibrate();
                print("Long pressed");
              }
            },
            onPressed: () {
              HapticFeedback.vibrate();
              print('on Pressed');
            },
          ),
        ),
      ),
    );
  }

  Widget Arrow(String direction) {
    if (direction == "up") {
      return Container(
        height: MediaQuery.of(context).size.height * 0.098,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.0),
          color: Colors.black,
        ),
        child: GestureDetector(
          child: InkWell(
            child: RaisedButton(
              padding: EdgeInsets.all(16.0),
              child: Icon(
                Icons.arrow_upward,
                color: Colors.lightGreen.shade800,
              ),
              color: Colors.grey.shade900,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.black,
                  width: 7,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(35.0),
              ),
              onLongPress: () {
                HapticFeedback.vibrate();
                print("Long pressed");
              },
              onPressed: () {
                HapticFeedback.vibrate();
                print('on Pressed');
              },
            ),
          ),
        ),
      );
    } else {
      return Container(
        height: MediaQuery.of(context).size.height * 0.098,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.0),
          color: Colors.black,
        ),
        child: GestureDetector(
          child: InkWell(
            child: RaisedButton(
              padding: EdgeInsets.all(16.0),
              child: Icon(
                Icons.arrow_downward,
                color: Colors.lightGreen.shade800,
              ),
              color: Colors.grey.shade900,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.black,
                  width: 7,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(35.0),
              ),
              onLongPress: () {
                HapticFeedback.vibrate();
                print("Long pressed");
              },
              onPressed: () {
                HapticFeedback.vibrate();
                print('on Pressed');
              },
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Unit Converter",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          NestedTabBar(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        button(
                            "7", 1, Colors.white, Colors.grey.shade900, null),
                        button(
                            "8", 1, Colors.white, Colors.grey.shade900, null),
                        button(
                            "9", 1, Colors.white, Colors.grey.shade900, null),
                        button("⌫", 1, Colors.lightGreen.shade800,
                            Colors.grey.shade900, "Multipication"),
                      ],
                    ),
                    TableRow(
                      children: [
                        button(
                            "4", 1, Colors.white, Colors.grey.shade900, null),
                        button(
                            "5", 1, Colors.white, Colors.grey.shade900, null),
                        button(
                            "6", 1, Colors.white, Colors.grey.shade900, null),
                        button("C", 1, Colors.orange, Colors.grey.shade900,
                            "Minus"),
                      ],
                    ),
                    TableRow(
                      children: [
                        button(
                            "1", 1, Colors.white, Colors.grey.shade900, null),
                        button(
                            "2", 1, Colors.white, Colors.grey.shade900, null),
                        button(
                            "3", 1, Colors.white, Colors.grey.shade900, null),
                        Arrow("up"),
                      ],
                    ),
                    TableRow(
                      children: [
                        button(
                            "+/-", 1, Colors.white, Colors.grey.shade900, null),
                        button(
                            "0", 1, Colors.white, Colors.grey.shade900, null),
                        button(
                            ".", 1, Colors.white, Colors.grey.shade900, null),
                        Arrow("down"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
