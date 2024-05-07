import "package:flutter/material.dart";
import "package:quiz_app/data/questions.dart";
import "package:quiz_app/questioins_screen.dart";
import "package:quiz_app/results_screen.dart";
import "package:quiz_app/start_screen.dart";

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = "start-screen";

  void switchScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        selectedAnswers = [];
        activeScreen = "result-screen";
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Widget> screens = {
      "start-screen": StartScreen(switchScreen),
      "questions-screen": QuestionsScreen(onSelectAnswer: chooseAnswer),
      "result-screen":
          ResultsScreen(chosenAnswers: selectedAnswers, onRestart: restartQuiz)
    };
    Widget? screenWidget = screens[activeScreen];

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 168)
            ], begin: Alignment.topLeft, end: Alignment.topRight),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
