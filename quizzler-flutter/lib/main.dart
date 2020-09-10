import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizzBrain quizzBrain = QuizzBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          title: Text(
            'Quizzler',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey.shade900,
        ),
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
  int score = 0;
  int newScore = 0;

  void showIcon(icon, color) {
    scoreKeeper.add(
      Icon(
        icon,
        color: color,
      ),
    );
  }

  finishAlert(context, int score) {
    var alertStyle = AlertStyle(
        animationType: AnimationType.shrink,
        isCloseButton: false,
        isOverlayTapDismiss: false,
        descStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        animationDuration: Duration(milliseconds: 400),
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: Colors.green,
          ),
        ),
        titleStyle: TextStyle(
          color: Colors.green,
        ),
        backgroundColor: Colors.grey.shade900,
        constraints: BoxConstraints.expand(width: 600));

    Alert(
      context: context,
      style: alertStyle,
      type: AlertType.success,
      title: 'You\'ve finished the game',
      buttons: [
        DialogButton(
          child: Text(
            "RESTART",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            setState(() {
              quizzBrain.resetGame();
              score = 0;
            });
            Navigator.pop(context);
          },
          color: Color.fromRGBO(0, 179, 134, 1.0),
          radius: BorderRadius.circular(70),
        ),
      ],
    ).show();
  }

  resetAlert(context, int score) {
    var alertStyle = AlertStyle(
        animationType: AnimationType.shrink,
        isCloseButton: false,
        isOverlayTapDismiss: false,
        descStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        animationDuration: Duration(milliseconds: 400),
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: Colors.green,
          ),
        ),
        titleStyle: TextStyle(
          color: Colors.green,
        ),
        backgroundColor: Colors.grey.shade900,
        constraints: BoxConstraints.expand(width: 600));

    Alert(
      context: context,
      style: alertStyle,
      type: AlertType.info,
      title: "Are you sure do you want to restart the game?",
      buttons: [
        DialogButton(
          child: Text(
            "Yes",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            Navigator.pop(context);
            setState(() {
              quizzBrain.resetGame();
              scoreKeeper = [];
            });
          },
          color: Color.fromRGBO(0, 179, 134, 1.0),
          radius: BorderRadius.circular(70),
        ),
        DialogButton(
          child: Text(
            "No",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.red,
          radius: BorderRadius.circular(70),
        ),
      ],
    ).show();
  }

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizzBrain.getQuestionAnswer();
    setState(() {
      if (quizzBrain.isFinished() == true) {
        finishAlert(context, score);
        scoreKeeper = [];
      } else {
        if (userPickedAnswer == correctAnswer) {
          showIcon(Icons.check, Colors.green);
        } else {
          showIcon(Icons.close, Colors.red);
        }
      }
      quizzBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          IconButton(
              icon: Icon(
                Icons.refresh,
                size: 50,
                color: Colors.green,
              ),
              onPressed: () {
                resetAlert(context, score);
              }),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quizzBrain.getQuestionText(),
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
                    color: Color.fromRGBO(0, 179, 134, 1.0),
                    child: Text(
                      'True',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      checkAnswer(true);
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
                      checkAnswer(false);
                    },
                  ),
                ),
              ),
            ],
          ),

          //SCOREKEEPER
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: scoreKeeper,
            ),
          ),
        ],
      ),
    );
  }
}
