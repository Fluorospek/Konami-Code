import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Function eq = const ListEquality().equals;
  List<String> useranswer = [];
  List<String> correctanswer = [
    'up',
    'up',
    'down',
    'down',
    'left',
    'right',
    'left',
    'right',
    'B',
    'A'
  ];
  bool checkanswer = false;
  List<Widget> boxwidget = [];
  List<Widget> buttonwidget = [];

  Widget text(Text text) {
    return SizedBox(
      child: text,
    );
  }

  Widget button() {
    return SizedBox(
      width: 320,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(shape: StadiumBorder()),
        child: Text('Restart'),
        onPressed: () {
          setState(() {
            useranswer.clear();
            boxwidget.clear();
            buttonwidget.clear();
          });
        },
      ),
    );
  }

  Widget box(Icon icon, String text) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: FlatButton(
        child: icon,
        onPressed: () {
          useranswer.add(text);
        },
      ),
    );
  }

  Widget box1(Text text, String text1) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: FlatButton(
        child: text,
        onPressed: () {
          useranswer.add(text1);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 300, 0, 0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        box(Icon(Icons.arrow_upward), 'up'),
                        box(Icon(Icons.arrow_downward), 'down'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        box(Icon(Icons.arrow_left), 'left'),
                        box(Icon(Icons.arrow_right), 'right'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        box1(Text('A'), 'A'),
                        box1(Text('B'), 'B'),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          child: FlatButton(
                            child: Text('START'),
                            onPressed: () {
                              print(useranswer);
                              checkanswer = eq(useranswer, correctanswer);
                              print(checkanswer);
                              setState(() {
                                if (checkanswer)
                                  boxwidget.add(
                                      text(Text('Correct Answer is: Contra')));
                                else
                                  boxwidget.add(text(Text('Try Again')));
                                buttonwidget.add(button());
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: boxwidget,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: buttonwidget,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
