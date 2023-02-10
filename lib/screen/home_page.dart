import 'package:flutter/material.dart';
import 'package:flutter_quizzy/constant.dart';
import 'package:flutter_quizzy/model/question_maker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Icon> scoreKeeper = [];
  QuestionMaker questionMaker = QuestionMaker();
  void checkAnswer(bool userPickedAnswers) {
    bool correctAnswer = questionMaker.getCorrectAnswer();
    setState(() {
      if (questionMaker.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();
        questionMaker.reset();
        scoreKeeper = [];
      } else {
        if (userPickedAnswers == correctAnswer) {
          scoreKeeper.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        questionMaker.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Quizzy"),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 5,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  child: Center(
                    child: Text(
                      questionMaker.getQuestionText(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: KRoyalBlue,
                      ),
                    ),
                  ),
                )),
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(kDefaultPadding - 4),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: kBlueColor),
                  onPressed: () {
                    checkAnswer(true);
                  },
                  child: const Text('True')),
            )),
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(kDefaultPadding - 4),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: kRedColor),
                  onPressed: () {
                    checkAnswer(false);
                  },
                  child: const Text('False')),
            )),
            Row(children: scoreKeeper)
            // SizedBox(
            //   height: 100,
            //   child: ListView.builder(
            //       itemCount: scoreKeeper.length,
            //       scrollDirection: Axis.horizontal,
            //       shrinkWrap: true,
            //       itemBuilder: (context, index) {
            //         return Row(children: scoreKeeper);
            //       }),
            // )
          ],
        ));
  }
}
