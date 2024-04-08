import 'dart:math';
import 'package:flutter/material.dart';
// import 'package:neumorphic_ui/neumorphic_ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // DateTime time = DateTime.now();

  bool start = true;
  double sec = (3 * pi) / 2;
  int second = 0;
  double min = (3 * pi) / 2;
  int mindigital = 0;
  double hour = (3 * pi) / 2;
  int hourdigital = 0;

  @override
  void initState() {
    super.initState();
    start;
  }

  timer() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (second >= 59) {
          sec = (3 * pi) / 2;
          second = 0;
          mindigital++;
          min = min + (pi / 3);
        } else if (mindigital >= 59) {
          min = (3 * pi) / 2;
          mindigital = 0;
          hourdigital++;
        } else if (hourdigital >= 24) {
          hour = hour + (pi / 6);
          hourdigital = 0;
        } else {
          second++;
          sec = sec + (pi / 30);
        }
      });
      timer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Stopwatch",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        actions: [
          Icon(
            Icons.settings,
            color: Colors.green,
            size: 30,
          )
        ],
      ),
      body: Container(
        // color: Colors.black,
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.center,
                  // color: Colors.black,
                  child: Container(
                    height: 300,
                    width: 300,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(150),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 25,
                            spreadRadius: 1,
                            color: Colors.black.withOpacity(0.3),
                          )
                        ],
                        border: Border(
                          right: BorderSide(color: Colors.green),
                          top: BorderSide(color: Colors.green),
                          left: BorderSide(color: Colors.green),
                          bottom: BorderSide(color: Colors.green),
                        )),
                    child: Text(
                      "$hourdigital : $mindigital :$second",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  second = 0;
                                  mindigital = 0;
                                  hourdigital = 0;
                                });
                              },
                              child: Text(
                                "Reset",
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff46408f),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (start == false) {
                                    timer();
                                  } else {
                                    start = !start;
                                  }
                                });
                              },
                              child: Text(
                                (start) ? "Start" : "Stop",
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff46408f),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  // color: Colors.amber,
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.of(context).pushNamed("AlarmClock");
          });
        },
        elevation: 2,
        child: const Icon(Icons.watch_later),
      ),
    );
  }
}
