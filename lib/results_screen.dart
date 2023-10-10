import "package:adv_basics/data/questions.dart";
import "package:adv_basics/quiz.dart";
import "package:flutter/material.dart";
import "package:adv_basics/questions_summary.dart";
import "package:google_fonts/google_fonts.dart";

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswer});

  final List<String> chosenAnswer;

  List<Map<String, Object>> showSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final summaryData = showSummaryData();
    final numCorrectAnswer = summaryData.where((data) {
      // (data)---> map values
      return data['correct_answer'] == data['user_answer']; // true or false
    }).length; //--> summary data.where creates new list with map values consisting of matching correct_answer== user_answer and finally
    //length of list is stored in numCorrectAnswer
    return SizedBox(
      width: double.infinity,
      child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "You answered  $numCorrectAnswer out of   $numTotalQuestions question! correctly",
                style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              QuestionSummary(summaryData),
              const SizedBox(height: 30),
              TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const Quiz(),
                    ),
                  );
                },
                style: TextButton.styleFrom(foregroundColor: Colors.white),
                label: Text("Restart Quiz !",
                    style: GoogleFonts.russoOne(fontSize: 16)),
                icon: const Icon(Icons.refresh),
              )
            ],
          )),
    );
  }
}
