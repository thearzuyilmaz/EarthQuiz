import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260.0,
      child: SingleChildScrollView(
        child: Column(
            children: summaryData
                .map(
                  (data) => Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 210, 173, 219),
                            borderRadius: BorderRadius.circular(100)),
                        child: Text(
                          ((data['question_index'] as int) + 1).toString(),
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                fontSize: 17.0,
                                color: Colors.indigo,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ((data['question'] as String)).toString(),
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                    fontSize: 13.0,
                                    color: Color.fromARGB(255, 210, 173, 219),
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: .4,
                                  ),
                                ),
                              ),
                              Text(
                                ((data['correct_answer'] as String)).toString(),
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                    fontSize: 13.0,
                                    color: Color.fromARGB(255, 248, 248, 248),
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: .4,
                                  ),
                                ),
                              ),
                              Text(
                                ((data['user_answer'] as String)).toString(),
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                    fontSize: 13.0,
                                    color: Color.fromARGB(255, 248, 248, 248),
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: .4,
                                  ),
                                ),
                              ),
                            ]),
                      )
                    ],
                  ),
                )
                .toList()),
      ),
    );
  }
}

// As map() returns iterable, use toList() to make it a list
