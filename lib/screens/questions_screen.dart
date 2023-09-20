import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String selectedAnswer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  // triggers with chosen answerButton
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer); // comes from quiz_app as parameter
    setState(() {
      currentQuestionIndex++; //increment by 1
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Center(
      child: Container(
        margin: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('images/earth.png',
                color: const Color.fromARGB(132, 248, 248, 248)),
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  color: Color.fromARGB(255, 228, 197, 238),
                  letterSpacing: .5,
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ...currentQuestion
                .getShuffledList() // shuffledAnswers derdik parantezsiz eğer gettter kullansaydık
                .map((answer) => AnswerButton(
                    answerText: answer,
                    onTap: () {
                      answerQuestion(answer);
                    }))
                .toList(),
          ],
        ),
      ),
    );
  }
}
