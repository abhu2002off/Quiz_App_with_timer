import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:adv_basics/quiz.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,
      {super.key}); // constructor accepting function as value and initialization takes place through this keyword

  final void Function()
      startQuiz; // storing function in a void Function() type variable and declared final

  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/quiz-logo.png",
          width: 300,
          color: const Color.fromARGB(205, 255, 255, 255),
        ),
        /*Opacity(
            opacity: 0.6,
            child: Image.asset('assets/images/quiz-logo.png', width: 300))*/
        const SizedBox(height: 80),
        Text(
          AppLocalizations.of(context).learnFlutterthefunway,
          style: GoogleFonts.openSans(fontSize: 24, color: Colors.white),
        ),
        const SizedBox(height: 30),
        OutlinedButton.icon(
            onPressed:
                startQuiz, //called switchScreen function as value from quiz.dart
            icon: const Icon(Icons.arrow_right_alt),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            label: Text(AppLocalizations.of(context).startQuiz))
      ],
    ));
  }
}
