import 'package:flutter/material.dart';
import 'dart:async';

class Timerwidget extends StatefulWidget {
  const Timerwidget({super.key});

  @override
  State<Timerwidget> createState() {
    return _TimerwidgetState();
  }
}

class _TimerwidgetState extends State<Timerwidget> {
  int second = 60;
  Timer? timer;
  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (second > 0) {
          second--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(context) {
    return const Text("I am Timer");
  }
}
