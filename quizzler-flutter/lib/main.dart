import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';

QuizzBrain qizzBrain = QuizzBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  int questionNumber = 0;
  int score = 0;

  void showResult(icon, color) {
    scoreKeeper.add(
      Icon(
        icon,
        color: color,
        size: 90,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  qizzBrain.questionList[questionNumber].questionText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                    textColor: Colors.white,
                    color: Colors.green,
                    child: Text(
                      'True',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      bool correctAnswer =
                          qizzBrain.questionList[questionNumber].questionAnswer;

                      if (correctAnswer == true) {
                        setState(() {
                          showResult(Icons.check, Colors.green);
                          questionNumber++;
                          score++;
                        });
                      } else {
                        setState(() {
                          showResult(Icons.close, Colors.red);
                          questionNumber++;
                        });
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                    color: Colors.red,
                    child: Text(
                      'False',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      bool correctAnswer =
                          qizzBrain.questionList[questionNumber].questionAnswer;

                      if (correctAnswer == false) {
                        setState(() {
                          showResult(Icons.check, Colors.green);
                          questionNumber++;
                          score++;
                        });
                      } else {
                        setState(() {
                          showResult(Icons.close, Colors.red);
                          questionNumber++;
                        });
                      }
                    },
                  ),
                ),
              ),
            ],
          ),

          //SCOREKEEPER
          Container(
            height: 200,
            width: double.infinity,
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: scoreKeeper,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              'Your Score: ' + score.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
