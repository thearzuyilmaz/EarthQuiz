import 'package:flutter/material.dart';
import 'package:quiz_app/screens/questions_screen.dart';
import 'package:quiz_app/screens/results_screen.dart';
import 'package:quiz_app/screens/start_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/results_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  // there is no button here to switch, so we will send
  // this func inside StartScreen() to handle switching there
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void storeSelectedAnswers(String selectedAnswer) {
    selectedAnswers.add(selectedAnswer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    // defined variable conditions here to build screens instead of creating an _init state

    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: storeSelectedAnswers);
    }
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color.fromARGB(255, 95, 39, 236),
                Color.fromARGB(255, 40, 6, 125)
              ])),
          child: screenWidget,
        ),
      ),
    );
  }
}
