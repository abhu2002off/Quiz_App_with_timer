import 'dart:async';
import 'package:adv_basics/models/quiz_question.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/models/quiz_question.dart';
import 'package:adv_basics/question_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class TimerWidget extends StatefulWidget {
  TimerWidget({super.key, required this.answerQuestion});
  final void Function(String answer) answerQuestion;
  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  // late Timer timer;

  @override
  void initState() {
    // TODO: implement initState
    // if (mounted) {
    startTimer();
    // }
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //  timer.cancel();
  }

  startTimer() {
    Timer timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (QuizQuestion.start > 0) {
          QuizQuestion.start--;
        } else {
          timer.cancel();
          widget.answerQuestion("");
          startTimer();
        }
        // if(start == 0) {
        //   QuestionsScreen(onSelectAnswer: ,)
        // }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // int start1 = QuizQuestions.start;

    return Stack(alignment: Alignment.center, children: [
      Text("${QuizQuestion.start}",
          style: GoogleFonts.lato(fontSize: 20, color: Colors.white)),
      SizedBox(
        width: 80,
        height: 80,
        child: CircularProgressIndicator(
          value: QuizQuestion.start / 60,
          valueColor: const AlwaysStoppedAnimation(Colors.white),
        ),
      )
    ]);
  }
}
