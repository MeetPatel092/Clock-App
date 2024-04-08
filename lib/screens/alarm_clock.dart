import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AlarmClock extends StatefulWidget {
  const AlarmClock({super.key});

  @override
  State<AlarmClock> createState() => _AlarmClockState();
}

class _AlarmClockState extends State<AlarmClock> {
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
          "Alarm Clock",
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
      body: Container(
        alignment: Alignment.center,
        // color: Colors.black,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 300,
                      width: 300,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(150),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 15,
                              spreadRadius: 2,
                              color: Colors.green.withOpacity(0.4),
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
                          color: Colors.green,
                        ),
                      )),
                ],
              ),
            ),
            Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(20),
                  // color: Colors.black,
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 75,
                        width: 375,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 20,
                                spreadRadius: 2,
                                color: Colors.grey,
                                offset: Offset(0, 5),
                              )
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "5:30",
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "am",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              Switch(
                                  value: start,
                                  // inactiveThumbColor:
                                  //     Colors.green.withOpacity(0.2),
                                  inactiveTrackColor:
                                      Colors.green.withOpacity(0.4),
                                  activeColor: Colors.green.shade900,
                                  activeTrackColor: Colors.green.shade400,
                                  onChanged: (val) {
                                    setState(() {
                                      start = val;
                                    });
                                  })
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 75,
                        width: 375,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 20,
                                spreadRadius: 2,
                                color: Colors.grey,
                                offset: Offset(0, 5),
                              )
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "7:30",
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "am",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              Switch(
                                  value: start2,
                                  inactiveTrackColor:
                                      Colors.green.withOpacity(0.4),
                                  activeColor: Colors.green.shade900,
                                  activeTrackColor: Colors.green.shade400,
                                  onChanged: (val) {
                                    setState(() {
                                      start2 = val;
                                    });
                                  })
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 75,
                        width: 375,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 20,
                                spreadRadius: 2,
                                color: Colors.grey,
                                offset: Offset(0, 5),
                              )
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "8:00",
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "am",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              Switch(
                                  value: start3,
                                  inactiveTrackColor:
                                      Colors.green.withOpacity(0.4),
                                  activeColor: Colors.green.shade900,
                                  activeTrackColor: Colors.green.shade400,
                                  onChanged: (val) {
                                    setState(() {
                                      start3 = val;
                                    });
                                  })
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }
}
