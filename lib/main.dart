import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:samsungcalculatorclone/conversion.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(splashColor: Colors.grey),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String equation = "";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;
  var _tapPosition;

  // Function when a button is pressed.
  buttonPressed(String symbol) {
    setState(() {
      if (symbol == "C") {
        equation = "0";
        result = "0";
        equationFontSize = 38.0;
        resultFontSize = 48.0;
      } else if (symbol == "()") {
      } else if (symbol == "=") {
        equationFontSize = 38.0;
        resultFontSize = 48.0;
        expression = equation;
        expression = expression.replaceAll('×', "*");
        expression = expression.replaceAll('÷', "/");
        try {
          // Comes from math expressions plugin.
          // This will help to solve the given equation.
          Parser p = new Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = 'error';
        }
      } else if (symbol == "⌫") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else {
        if (equation == "0") {
          equation = symbol;
        } else {
          equation = equation + symbol;
        }
        equationFontSize = 38.0;
        resultFontSize = 48.0;
      }
    });
  }

  Widget clearButton() {
    if (equation != "0") {
      print(equation);
      return Container(
        height: MediaQuery.of(context).size.height * 0.098,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.0),
          color: Colors.black,
        ),
        child: GestureDetector(
          onTapDown: _storePosition,
          child: InkWell(
            child: RaisedButton(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "⌫",
                style: TextStyle(
                  color: Colors.lightGreen.shade800,
                  fontSize: 20.0,
                ),
              ),
              color: Colors.black,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.black,
                  width: 7,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(50.0),
              ),
              onLongPress: () {},
              onPressed: () {
                HapticFeedback.vibrate();
                buttonPressed("⌫");
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
        child: RaisedButton(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "⌫",
            style: TextStyle(
              color: Colors.lightGreen.shade900,
              fontSize: 20.0,
            ),
          ),
          color: Colors.black,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.black,
              width: 7,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(35.0),
          ),
        ),
      );
    }
  }

  void _storePosition(TapDownDetails details) {
    _tapPosition = details.globalPosition;
    print(_tapPosition);
  }

  void _showCustomMenu(String name) {
    final RenderBox overlay = Overlay.of(context).context.findRenderObject();
    showMenu(
        context: context,
        items: <PopupMenuEntry<int>>[
          PopupMenuItem(
              child: Text(
            name,
            style: TextStyle(
              fontSize: 25.0,
            ),
          )),
        ],
        position: RelativeRect.fromRect(
            _tapPosition & Size(20, 20), // smaller rect, the touch area
            Offset.zero & overlay.size // Bigger rect, the entire screen
            ));
  }

  Widget button(String symbol, double buttonHeight, Color textColor,
      Color bgColor, String name) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.098 * buttonHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35.0),
        color: Colors.black,
      ),
      child: GestureDetector(
        onTapDown: _storePosition,
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
                _showCustomMenu(name);
                HapticFeedback.vibrate();
                print("Long pressed");
              }
            },
            onPressed: () {
              HapticFeedback.vibrate();
              print('on Pressed');
              buttonPressed(symbol);
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(
                equation,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: equationFontSize,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
              child: Text(
                result,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: resultFontSize,
                ),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.098,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35.0),
                    color: Colors.black,
                  ),
                  child: GestureDetector(
                    onTapDown: _storePosition,
                    child: InkWell(
                      child: RaisedButton(
                        padding: EdgeInsets.all(33.0),
                        child: Icon(
                          Icons.access_time,
                          color: Colors.white,
                        ),
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: 7,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        onLongPress: () {},
                        onPressed: () {
                          HapticFeedback.vibrate();
                          print('on Pressed');
                          buttonPressed("");
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.098,
                  width: MediaQuery.of(context).size.height * 0.098,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35.0),
                    color: Colors.black,
                  ),
                  child: GestureDetector(
                    onTapDown: _storePosition,
                    child: InkWell(
                      child: RaisedButton(
                        padding: EdgeInsets.all(30.0),
                        child: Image(
                          image: AssetImage("images/ruler.png"),
                        ),
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: 7,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        onLongPress: () {},
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UnitsConversion()));
                          HapticFeedback.vibrate();
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.098,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35.0),
                    color: Colors.black,
                  ),
                  child: GestureDetector(
                    onTapDown: _storePosition,
                    child: InkWell(
                      child: RaisedButton(
                        padding: EdgeInsets.all(33.0),
                        child: Image(
                          image: AssetImage("images/scintific.png"),
                        ),
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: 7,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        onLongPress: () {},
                        onPressed: () {
                          HapticFeedback.vibrate();
                          print('on Pressed');
                          buttonPressed("");
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(),
                ),
                clearButton(),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
              height: 0.5,
              width: double.infinity,
              color: Colors.grey,
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Table(
                    children: [
                      TableRow(
                        children: [
                          button("C", 1, Colors.orange.shade900,
                              Colors.grey.shade900, "Clear"),
                          button("()", 1, Colors.lightGreen.shade800,
                              Colors.grey.shade900, "Brackets"),
                          button("%", 1, Colors.lightGreen.shade800,
                              Colors.grey.shade900, "Percentage"),
                          button("÷", 1, Colors.lightGreen.shade800,
                              Colors.grey.shade900, "Division"),
                        ],
                      ),
                      TableRow(
                        children: [
                          button(
                              "7", 1, Colors.white, Colors.grey.shade900, null),
                          button(
                              "8", 1, Colors.white, Colors.grey.shade900, null),
                          button(
                              "9", 1, Colors.white, Colors.grey.shade900, null),
                          button("×", 1, Colors.lightGreen.shade800,
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
                          button("-", 1, Colors.lightGreen.shade800,
                              Colors.grey.shade900, "Minus"),
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
                          button("+", 1, Colors.lightGreen.shade800,
                              Colors.grey.shade900, "Plus"),
                        ],
                      ),
                      TableRow(
                        children: [
                          button("+/-", 1, Colors.white, Colors.grey.shade900,
                              null),
                          button(
                              "0", 1, Colors.white, Colors.grey.shade900, null),
                          button(
                              ".", 1, Colors.white, Colors.grey.shade900, null),
                          button("=", 1, Colors.white,
                              Colors.lightGreen.shade800, "Equal"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
