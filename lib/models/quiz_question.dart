// question blueprint (consists of question and possible answer)
// this file is created for object creation  which have question and answer storing variables

class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  static int start = 60;

  final String text;
  final List<String> answers;

  List<String> getShuffleAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
