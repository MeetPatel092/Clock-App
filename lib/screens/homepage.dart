import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({Key? key}) : super(key: key);

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  late Stopwatch stopwatch;
  late Timer timer;

  bool start = true;
  double sec = (3 * pi) / 2;
  int secDigital = 0;
  double milis = (3 * pi) / 2;
  int miliDigital = 0;
  double min = (3 * pi) / 2;
  int minDigital = 0;
  double hour = (3 * pi) / 2;
  int hourDigital = 0;

  @override
  void initState() {
    super.initState();

    stopwatch = Stopwatch();

    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        secDigital = stopwatch.elapsed.inSeconds % 60;
        minDigital = stopwatch.elapsed.inMinutes % 60;
        hourDigital = stopwatch.elapsed.inHours % 12;

        sec = (3 * pi) / 2 + secDigital * (pi / 30);
        min = (3 * pi) / 2 + minDigital * (pi / 30);
        hour = (3 * pi) / 2 + hourDigital * (pi / 6);
      });
    });
  }

  String formatTime(int time) {
    if (time < 10) {
      return '0$time';
    } else {
      return '$time';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "StopWatch",
          style: TextStyle(
            color: Colors.green,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(
              Icons.settings,
              size: 30,
              color: Colors.green,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                child: Container(
                  height: 300,
                  width: 300,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(150),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 15,
                          spreadRadius: 2,
                          color: Colors.white.withOpacity(0.7),
                        )
                      ],
                      border: Border.all(
                          color: Colors.green.withOpacity(0.4), width: 3)),
                  child: Text(
                    "${formatTime(hourDigital)} : ${formatTime(minDigital)} : ${formatTime(secDigital)}",
                    style: TextStyle(
                      color: Colors.green.shade700,
                      fontSize: 45,
                    ),
                  ),
                ),
              )),
          Expanded(
            flex: 2,
            child: Container(
              // color: Colors.purple,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            stopwatch.reset();
                            stopwatch.start();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.purple,
                          backgroundColor: Colors.white,
                        ),
                        child: Text(
                          "Start",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.green),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            stopwatch.stop();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.purple,
                          backgroundColor: Colors.white,
                        ),
                        child: Text(
                          "Stop",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.green),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            stopwatch.reset();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.green,
                        ),
                        child: Text(
                          "Reset",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            // color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
