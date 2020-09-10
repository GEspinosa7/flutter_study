import 'package:destini_challenge_starting/story_brain.dart';
import 'package:flutter/material.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  String storyTitle = storyBrain.getStory();
  String choice1 = storyBrain.getChoice1();
  String choice2 = storyBrain.getChoice2();

  void change() {
    storyTitle = storyBrain.getStory();
    choice1 = storyBrain.getChoice1();
    choice2 = storyBrain.getChoice2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/background.png"), fit: BoxFit.cover)),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyTitle,
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  onPressed: () {
                    storyBrain.nextStory(1);
                    setState(() {
                      change();
                    });
                  },
                  color: Colors.red,
                  child: Text(
                    choice1,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: FlatButton(
                    onPressed: () {
                      storyBrain.nextStory(2);
                      setState(() {
                        change();
                      });
                    },
                    color: Colors.blue,
                    child: Text(
                      choice2,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
