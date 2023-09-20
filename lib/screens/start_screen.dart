import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  StartScreen(this.startQuiz, {super.key});

  void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'images/quiz-logo.png',
            color: const Color.fromARGB(132, 248, 248, 248),
            width: 200.0,
          ),
          const SizedBox(
            height: 40.0,
          ),
          Text(
            'Check you knowledge!',
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                letterSpacing: .1,
                fontSize: 20.0,
                color: Color.fromARGB(255, 210, 173, 219),
              ),
            ),
          ),
          const SizedBox(height: 40.0),
          ElevatedButton.icon(
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Color.fromARGB(255, 95, 39, 236),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.0)),
            onPressed: startQuiz,
            label: Text(
              'Start Quiz',
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
    );
  }
}
