import 'package:flutter/material.dart';

class StartChallengeScreen extends StatelessWidget {
  final String object;
  var Quest = {
    "bottle": ["Hello", "your task is to", true]
  };
  static const int _blackPrimaryValue = 0xFF000000;

  static const MaterialColor primaryBlack = MaterialColor(
    _blackPrimaryValue,
    <int, Color>{
      50: Color(0xFF000000),
      100: Color(0xFF000000),
      200: Color(0xFF000000),
      300: Color(0xFF000000),
      400: Color(0xFF000000),
      500: Color(_blackPrimaryValue),
      600: Color(0xFF000000),
      700: Color(0xFF000000),
      800: Color(0xFF000000),
      900: Color(0xFF000000),
    },
  );
  StartChallengeScreen(this.object);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${Quest[object][0]}'),
      ),
      body: Center(
        child: Container(
            //color: Colors.amber,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //mainAxisSize: MainAxisSize.min,
                children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: RichText(
                          text: TextSpan(
                              text: "Quest ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 25,
                                  letterSpacing: 0.005),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "${Quest[object][0]}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal)),
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 70,
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20, left: 15, right: 15),
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text(
                      'Accept Quest',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              )
            ])),
      ),
    );
  }
}
