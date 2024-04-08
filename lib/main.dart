import 'package:alarm_clock/screens/alarm_clock.dart';
import 'package:alarm_clock/screens/clock.dart';
import 'package:alarm_clock/screens/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Clock(),
      routes: {
        'HomePage': (context) => const HomePage(),
        'AlarmClock': (context) => const AlarmClock(),
        'Clock': (context) => const Clock(),
      },
    ),
  );
}
