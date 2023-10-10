import "package:flutter/material.dart";
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/question_screen.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localization/flutter_localization.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key}); //constructor function accepting named key parameter
  @override
  State<Quiz> createState() {
    //--> createState() create instance of the class that based on State connected to Quiz
    return _QuizState(); //--> return constructor of private (_QuizState) class
  }
}

class _QuizState extends State<Quiz> {
  /*var*/ /* Widget?  activeScreen; */ //---> 1st Approach
  //Passing function as value to question_screen.dart by adding poitional parameter in constructor function of class QuestionScreen ,//variable can store widgtes,as widgets are object and object are values
  // we cannot use variable bcz each widgets are of specific type depnd upon there implemenatation so
  //use common type widget for stroing Widget
  // Both the variable (switchScreen) & method (void switch..) created simultaneously when the class is instantiated(Object is created)

  /*@override
  void initState() {
    //initState method executes first then build method is executed,so for futhur initialization initState is used
    super
        .initState(); // initState for parent class(State) is called to allow flutter to do additional initaization work
    activeScreen = StartScreen(switchScreen);
  }*/
  List<String> selectAnswers = [];

  var activeScreen = 'start-screen'; // ----> 2nd Approach
  void switchScreen() {
    setState(() {
      //---> Set state will lead to re-excute the build method upon updation of data variables in the state class
      //activeScreen = const QuestionsScreen();--->1st Approach
      activeScreen = 'questions-screen'; //--> 2nd Approach
    });
    print(selectAnswers);
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen); //---> 3 approach

    void chooseAnswer(String answer) {
      //this function is common between result page and question screen,state is changed in question_screen
      selectAnswers.add(answer);

      if (selectAnswers.length == questions.length) {
        setState(() {
          //selectAnswers = [];//Doubt
          activeScreen = 'results-screen';
        });
      }
    }

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }
    if (activeScreen == 'results-screen') {
      screenWidget = ResultScreen(
        chosenAnswer: selectAnswers,
      );
    }

    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        AppLocalizations.localizationsDelegates[1],
        AppLocalizations.localizationsDelegates[2],
        AppLocalizations.localizationsDelegates[3]
      ],
      locale: const Locale('hi'),
      supportedLocales: const [
        Locale('en'),
        Locale('hi'),
      ],
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 207, 201, 197),
                Color.fromARGB(255, 246, 88, 3)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: screenWidget //---> 3rd Appraoch
            /*activeScreen == 'start-screen'
              ? StartScreen(switchScreen)
              : const QuestionsScreen(),*/ // ----> 2nd approach
            //activeScreen,-->1st approach
            ),
      ),
    );
  }
}
