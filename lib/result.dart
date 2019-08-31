import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuizHandler;

  Result(this.resultScore, this.resetQuizHandler);

  String get resultPhrase {
    var resultText;
    if (resultScore > 0 && resultScore <= 8) {
      resultText = 'You Are Awesome And Innocent';
    } else if (resultScore > 8 && resultScore <= 12) {
      resultText = 'Pretty Likeable!';
    } else if (resultScore > 12 && resultScore <= 16) {
      resultText = 'You Are ... Strange?! ';
    } else {
      resultText = 'You Are So Bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Restart Quiz',
            ),
            textColor: Colors.blue,
            onPressed: resetQuizHandler,
          ),
        ],
      ),
    );
  }
}
