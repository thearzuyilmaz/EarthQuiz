import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final void Function() onRestart;
  final List<String> chosenAnswers;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i]
            .answers[0], // answer is the first one for all questions
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final int numTotalQuestions = questions.length;
    final List listCorrectAnswers = summaryData
        .where((element) => element['correct_answer'] == element['user_answer'])
        .toList();
    final int numCorrectAnswers = listCorrectAnswers.length;

    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectAnswers out of $numTotalQuestions questions correctly!',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  color: Color.fromARGB(255, 228, 197, 238),
                  letterSpacing: .5,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            QuestionsSummary(
                summaryData:
                    summaryData), // ***** getSummaryData() is a list, hence we are sending a list not the function ******
            const SizedBox(
              height: 75.0,
            ),
            ElevatedButton.icon(
              icon: const Icon(
                Icons.restart_alt_outlined,
                color: Color.fromARGB(255, 95, 39, 236),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0)),
              onPressed: onRestart,
              label: Text(
                'Restart Quiz',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 95, 39, 236),
                    fontSize: 25.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
