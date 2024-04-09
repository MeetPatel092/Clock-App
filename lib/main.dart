import 'package:alarm_clock/screens/alarm_clock.dart';
import 'package:alarm_clock/screens/clock.dart';
import 'package:alarm_clock/screens/homepage.dart';
import 'package:alarm_clock/screens/strep_watch.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Clock(),
      routes: {
        'StopWatch': (context) => const StopWatch(),
        'AlarmClock': (context) => const AlarmClock(),
        'Clock': (context) => const Clock(),
        'StrepWatch': (context) => const StrepWatch(),
      },
    ),
  );
}
