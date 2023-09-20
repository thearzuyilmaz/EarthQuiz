import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    required this.answerText,
    required this.onTap,
    super.key,
  });

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
        backgroundColor: const Color.fromARGB(255, 241, 112, 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
        style: GoogleFonts.roboto(
            textStyle: const TextStyle(
          letterSpacing: .4,
          fontSize: 17.0,
          color: Color.fromARGB(255, 255, 245, 237),
        )),
      ),
    );
  }
}
