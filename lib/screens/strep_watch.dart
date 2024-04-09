import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StrepWatch extends StatefulWidget {
  const StrepWatch({super.key});

  @override
  State<StrepWatch> createState() => _StrepWatchState();
}

class _StrepWatchState extends State<StrepWatch> {
  DateTime time = DateTime.now();

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
          "StrepWatch",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(
              Icons.settings,
              color: Colors.green,
              size: 30,
            ),
          )
        ],
      ),
      body: Container(
        // color: Colors.grey,
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                            "$hourdigital : $mindigital :$second",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          CircularProgressIndicator(
                            value: second * (1 / 60),
                            color: Colors.black,
                            backgroundColor: Colors.black.withOpacity(0.5),
                            strokeWidth: 8,
                            strokeAlign: 20,
                            strokeCap: StrokeCap.round,
                          ),
                          CircularProgressIndicator(
                            value: mindigital * (1 / 60),
                            color: Colors.blue,
                            backgroundColor: Colors.blue.withOpacity(0.4),
                            strokeWidth: 8,
                            strokeAlign: 28,
                            strokeCap: StrokeCap.round,
                          ),
                          CircularProgressIndicator(
                            value: hourdigital * (1 / 30),
                            color: Colors.green,
                            backgroundColor: Colors.green.withOpacity(0.3),
                            strokeWidth: 8,
                            strokeAlign: 35,
                            strokeCap: StrokeCap.round,
                          ),
                        ],
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(20),
                  // color: Colors.red,
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
                                blurRadius: 10,
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
                              Text(
                                "Dakar",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "10:43",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
                              Text(
                                "Tokyo",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "19:43",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
                              Text(
                                "Queensland",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "20:43",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
                              Text(
                                "Barcelona",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "12:43",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
