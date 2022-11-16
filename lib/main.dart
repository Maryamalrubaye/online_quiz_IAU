import 'package:flutter/material.dart';
import 'package:online_quiz_iau/styles/button.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'quiz_handler.dart';

void main() => runApp(const IAUQuiz());
QuizHandler quizHandler = QuizHandler();

class IAUQuiz extends StatelessWidget {
  const IAUQuiz({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.yellow.shade50,
      appBar: AppBar(
        title: const Text('IAU Quizzes'),
        backgroundColor: Colors.yellow.shade900,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: QuizStarter(),
        ),
      ),
    ));
  }
}

class QuizStarter extends StatefulWidget {
  @override
  QuestionsState createState() => QuestionsState();
}

class QuestionsState extends State<QuizStarter> {
  List<Icon> answerStatus = [];

  void check_answer(bool userAnswer) {
    bool checkAnswer = quizHandler.getAnswer();
    setState(() {
      if (quizHandler.quizIsFinished() == true) {
        Alert(
          context: context,
          title: 'Finished the IAU exam!',
          desc: 'It is the end of the quiz',
        ).show();
        quizHandler.clearQuestionCounter();
        answerStatus = [];
      } else {
        if (checkAnswer == userAnswer) {
          answerStatus.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
          print('Your answer is correct 🥰 ');
        } else {
          answerStatus.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
          print('sorry your answer is wrong 😥 ');
        }
        quizHandler.checkForNextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizHandler.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: ElevatedButton(
              style: primaryButton,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                ),
              ),
              onPressed: () {
                check_answer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
              padding: EdgeInsets.all(12.0),
              child: ElevatedButton(
                style: primaryButton,
                child: Text(
                  'False',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
                ),
                onPressed: () {
                  check_answer(false);
                },
              )),
        ),
        Row(
          children: answerStatus,
        )
      ],
    );
  }
}
