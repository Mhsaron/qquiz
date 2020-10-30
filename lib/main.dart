import 'package:flutter/material.dart';
import 'dart:math';

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
  List<String> question = [
    'As the number of ISPs has grown, a new form of network access point called a metropolitan area exchange has emerged.',
    'Common carriers include the RBOCs, IXCs, and Cable TV companies.',
    'Common carriers sell or lease communication services and facilities to the public.',
    'Circuit switched networks run over the public switched telephone networks operated by the common carriers.',
    'Cloud (as in cloud architecture) means that the design for the common carrier\'s network comes from satellite networks above the clouds.',
    'A dedicated circuit is usually not available late at nights or on weekends.',
    'Full mesh networks are inexpensive.',
    'Full mesh design networks are more common than partial mesh design networks.',
    'Datagrams are connection-oriented.',
    'Connectionless routing sets up a TCP connection, or virtual circuit between a sender and receiver.',
    'Virtual private networks permit users to create permanent virtual circuits, or tunnels, through the Internet.',
    'National Internet service providers connect together and exchange data at Network Access Points.',
    'Network access points were originally designed to connect only local ISPs.',
    'A point of presence is the place at which the ISP provides services to its customers.',
    'Peering means that a national ISP does not charge another national ISP to transmit its messages.',
    'Digital Subscriber Line is a family of multipoint technologies.',
    'The dominant standard for a cable modem is Data over Cable System Interface Specification.',
    'Internet 2 is the common name for the Abilene network.',
    'Each of the networks in Internet 2 has a set of access points called terapops.',
    'Security on a network not only means being able to prevent a hacker from breaking into your computer but also includes being able to recover from temporary service problems or from natural disasters.',
    'The rise of the Internet has increased significantly the potential vulnerability of an organization\'s assets.',
    'Confidentiality is not a threat to business continuity.',
    'Intrusion refers to confidentiality and integrity of data.',
    'A control spreadsheet lists threats to the network across the top of the spreadsheet and lists the network assets down the side of the sheet.',
    'A threat to the data communications network is any potential adverse occurrence that can do harm, interrupt the systems using the network, or cause a monetary loss to the organization.',
    'Companies have learned that threats from hacking from its own employees occur about as often as by outsiders.',
    'A NAT proxy server uses an address table to translate private IP addresses used inside the organization into proxy data link layer addressed used on the Internet.',
  ];
  List<bool> answer = [
    true,
    true,
    true,
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    true,
    true,
    false,
    true,
    true,
    false,
    true,
    true,
    false,
    true,
    true,
    false,
    true,
    true,
    true,
    true,
    true,
  ];
  int qn = Random().nextInt(26);

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
                question[qn],
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
                bool correctAnswer = answer[qn];
                if (correctAnswer == true) {
                  print('Right');
                } else {
                  print('wrong');
                }
                setState(() {
                  qn++;
                });
                print(qn);
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
                bool correctAnswer = answer[qn];
                if (correctAnswer == false) {
                  print('Right');
                } else {
                  print('wrong');
                }
                setState(() {
                  qn++;
                });
                print(qn);
              },
              child: Text('False'),
            ),
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.check,
              color: Colors.green,
            ),
            Icon(
              Icons.close,
              color: Colors.red,
            )
          ],
        )
      ],
    );
  }
}
