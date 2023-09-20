class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledList() {
    List<String> shuffledList = List.of(answers); // copy of answers List
    shuffledList.shuffle();
    return shuffledList;
  }

  // List<String> get ShuffledList {
  //   List<String> shuffledList = List.of(answers); // copy of answers List
  //   shuffledList.shuffle();
  //   return shuffledList;
}
