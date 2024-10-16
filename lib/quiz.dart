import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  String screenId = 'start-screen';
  List<String> selectedAnswers = [];

  void switchScreen(String id) {
    setState(() {
      screenId = id;
    });
  }

  void startQuiz() {
    switchScreen('questions-screen');
  }

  void repeatQuiz() {
    switchScreen('start-screen');
    setState(() {
      selectedAnswers = [];
    });
  }

  void selectAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        screenId = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = StartScreen(onStart: startQuiz);

    if (screenId == 'questions-screen') {
      activeScreen = QuestionsScreen(onSelectAnswer: selectAnswer);
    } else if (screenId == 'results-screen') {
      activeScreen = ResultsScreen(
        answers: selectedAnswers,
        onRepeat: repeatQuiz,
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
                  Color.fromARGB(255, 47, 2, 55),
                  Color.fromARGB(255, 134, 30, 152)
                ],
              ),
            ),
            child: activeScreen),
      ),
    );
  }
}
