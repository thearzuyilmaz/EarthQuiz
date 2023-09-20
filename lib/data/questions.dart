import 'package:quiz_app/models/quiz_question.dart';

// Totally 6 Questions
// First answer is correct answer, I will shuffle questions in UI
const questions = [
  QuizQuestion("What is the Earth's largest ocean?",
      ["Pacific Ocean", "Atlantic Ocean", "Indian Ocean", "Arctic Ocean"]),
  QuizQuestion("What is the Earth's average distance from the Sun?", [
    "93 million miles",
    "50 million kilometers",
    "150,000 miles",
    "200 million kilometers"
  ]),
  QuizQuestion("What is the Earth's approximate population?", [
    "7.9 billion (2021)",
    "10 billion (2021)",
    "5 billion (2021)",
    "2 billion (2021)"
  ]),
  QuizQuestion(
      "How many continents are there on Earth?", ["7", "5", "10", "3"]),
  QuizQuestion("What is the highest mountain on Earth?",
      ["Mount Everest", "K2", "Makalu", "Denali"]),
  QuizQuestion("What causes tides on Earth?",
      ["Moon and Sun", "Earth's rotation", "Winds", "Volcanoes"]),
];
