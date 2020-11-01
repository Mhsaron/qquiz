import 'package:flutter/material.dart';
import 'dart:math';
import 'question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(QQuizer());
}

class QQuizer extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
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
  List<Question> question = [
    Question(
        q: 'As the number of ISPs has grown, a new form of network access point called a metropolitan area exchange has emerged.',
        a: true),
    Question(
        q: 'Common carriers include the RBOCs, IXCs, and Cable TV companies.',
        a: true),
    Question(
        q: 'Common carriers sell or lease communication services and facilities to the public.',
        a: true),
    Question(
        q: 'Circuit switched networks run over the public switched telephone networks operated by the common carriers.',
        a: true),
    Question(
        q: 'Cloud (as in cloud architecture) means that the design for the common carrier\'s network comes from satellite networks above the clouds.',
        a: false),
    Question(
        q: 'A dedicated circuit is usually not available late at nights or on weekends.',
        a: false),
    Question(q: 'Full mesh networks are inexpensive.', a: false),
    Question(
        q: 'Full mesh design networks are more common than partial mesh design networks.',
        a: false),
    Question(q: 'Datagrams are connection-oriented.', a: false),
    Question(q: '', a: true),
  ];
  int qn = 0;
  void nextQuestion() {
    if (qn < question.length - 1) {
      qn++;
    }
    print(qn);
    //print(question.length);
  }

  bool isFinished() {
    if (qn >= question.length - 1) {
      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    qn = 0;
  }

  List<Icon> Score = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                question[qn].question,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, color: Colors.black87),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.green,
              onPressed: () {
                bool correctAnswer = question[qn].answer;
                setState(() {
                  if (isFinished() == true) {
                    Alert(
                      context: context,
                      title: 'Finished!',
                      desc: 'You\'ve reached the end of the quiz.',
                    ).show();

                    reset();
                    Score = [];
                  } else {
                    if (correctAnswer == true) {
                      Score.add(Icon(
                        Icons.check,
                        color: Colors.green,
                      ));
                    } else {
                      Score.add(Icon(
                        Icons.close,
                        color: Colors.red,
                      ));
                    }
                  }
                  nextQuestion();
                });
              },
              child: Text('True'),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              onPressed: () {
                bool correctAnswer = question[qn].answer;
                setState(() {
                  if (isFinished() == true) {
                    Alert(
                      context: context,
                      title: 'Finished!',
                      desc: 'You\'ve reached the end of the quiz.',
                    ).show();

                    reset();
                    Score = [];
                  }
                  if (correctAnswer == false) {
                    Score.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  } else {
                    Score.add(Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                  }
                  nextQuestion();
                });
              },
              child: Text('False'),
            ),
          ),
        ),
        Row(
          children: Score,
        )
      ],
    );
  }
}
