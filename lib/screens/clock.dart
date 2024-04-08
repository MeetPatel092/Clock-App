import 'dart:math';

import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  DateTime time = DateTime.now();

  bool start = true;
  bool start2 = true;
  bool start3 = true;
  double sec = (3 * pi) / 2;
  int second = 0;
  double min = (3 * pi) / 2;
  int mindigital = 0;
  double hour = (3 * pi) / 2;
  int hourdigital = 0;

  @override
  void initState() {
    super.initState();

    setState(() {
      second = time.second;
      mindigital = time.minute;
      hourdigital = time.hour;

      sec = sec + second * (pi / 30);
      min = min + mindigital * (pi / 30);
      hour = hour + hourdigital * (pi / 6);
    });

    timer();
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
          "Clock",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
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
      body: Column(
        children: [
          Expanded(
              flex: 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Container(
                      height: 300,
                      width: 300,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(150),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 15,
                            spreadRadius: 2,
                            color: Colors.green.withOpacity(0.4),
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.rotate(
                            angle: 3 * pi / 2,
                            child: Divider(
                              color: Colors.black,
                              thickness: 2,
                              endIndent: 130,
                              indent: MediaQuery.of(context).size.width / 2.7,
                            ),
                          ),
                          Container(
                            height: 250,
                            width: 250,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(150),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Transform.rotate(
                                  angle: sec,
                                  child: Divider(
                                    color: Colors.red,
                                    thickness: 2,
                                    endIndent: 2,
                                    indent:
                                        MediaQuery.of(context).size.width / 3,
                                  ),
                                ),
                                Transform.rotate(
                                  angle: min,
                                  child: Divider(
                                    color: Colors.green,
                                    thickness: 2,
                                    endIndent: 30,
                                    indent:
                                        MediaQuery.of(context).size.width / 3,
                                  ),
                                ),
                                Transform.rotate(
                                  angle: hour,
                                  child: Divider(
                                    color: Colors.black,
                                    thickness: 2,
                                    endIndent: 45,
                                    indent:
                                        MediaQuery.of(context).size.width / 3,
                                  ),
                                ),
                                CircleAvatar(
                                  maxRadius: 20,
                                  backgroundColor: Colors.green,
                                ),
                              ],
                            ),
                          ),
                          Transform.rotate(
                            angle: pi / 2,
                            child: Divider(
                              color: Colors.black,
                              thickness: 2,
                              endIndent: 130,
                              indent: MediaQuery.of(context).size.width / 2.7,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "$hourdigital : $mindigital :$second",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              )),
          Expanded(
              flex: 1,
              child: Container(
                // color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {
                          setState(() {
                            Navigator.of(context).pushNamed("HomePage");
                          });
                        },
                        child: Icon(
                          Icons.timer,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 80,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {
                          setState(() {
                            Navigator.of(context).pushNamed("AlarmClock");
                          });
                        },
                        child: Icon(
                          Icons.alarm,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
