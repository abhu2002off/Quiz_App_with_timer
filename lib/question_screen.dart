import "dart:async";

import "package:adv_basics/models/quiz_question.dart";
import "package:flutter/material.dart";
import "package:adv_basics/answer_button.dart";
import "package:adv_basics/data/questions.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:adv_basics/timer_1.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(
      {super.key,
      required this.onSelectAnswer}); // accepting functiona as value from quiz.dart

  final void Function(String answer)
      onSelectAnswer; // return type Function(keyword) (Datatype paramater_name) funtion_name
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);

    setState(() {
      //currentQuestionIndex = currentQuestionIndex+1;
      //currentQuestionIndex +=1;
      currentQuestionIndex++;
      //increments the value by 1
      QuizQuestion.start = 60;
    });
  }

  @override
  // void initState() {
  //   super.initState();
  //   startTimer();
  // }

  @override
  // void dispose() {
  //   super.dispose();
  //   timer!.cancel();
  //   //startTimer();
  // }

  // int second = 60;
  // Timer? timer;
  // startTimer() {
  //   timer = Timer.periodic(const Duration(seconds: 1), (timer) {
  //     setState(() {
  //       if (second > 0) {
  //         second--;
  //       } else {
  //         timer.cancel();
  //       }
  //     });
  //   });
  // }

  @override
  Widget build(context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    var deviceScreenHeight = queryData.size.height;
    final currentQuestion = questions[currentQuestionIndex];

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: deviceScreenHeight * 0.15,
        ),
        //
        TimerWidget(
          answerQuestion: answerQuestion, //------->Timer
        ),
        SizedBox(
          height: deviceScreenHeight * 0.10,
        ),
        SizedBox(
            width: double.infinity,
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //only accept list of inidividual list(cannot accept list-->list)
                  Text(
                    currentQuestion.text,
                    style: GoogleFonts.openSans(
                        color: Color.fromARGB(255, 254, 244, 235),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  ...currentQuestion.getShuffleAnswers().map((answer) {
                    //list of string(answer) converted to list of widgets(AnswerButton) ,
                    //then it is converted to individual button resulting into list of widget in children of column(...(befor currentQuestion))
                    return AnswerButton(
                        answerText: answer,
                        onTap: () {
                          answerQuestion(answer);
                        });
                  }),
                ],
              ),
            )),
      ],
    );
  }
}
