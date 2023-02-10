import 'package:flutter_quizzy/model/question.dart';

class QuestionMaker {
  int _questionNumber = 0;

  final List<Question> _questionBanks = [
    Question(
        questionText: 'Venus is hottest in the solar system.',
        questionAnswer: true),
    Question(
        questionText: 'Brazil won the very first FIFA World Cup in 1930?',
        questionAnswer: false),
    Question(
        questionText: 'Kal El was Superman’s birth name.',
        questionAnswer: true),
    Question(questionText: 'A slug\'s blood is green.', questionAnswer: true),
    Question(
        questionText:
            'The Great Pyramid of Giza,Egypt is the seven wonders of the world.',
        questionAnswer: true),
    Question(
        questionText: 'It is illegal to pee in the Ocean in Portugal.',
        questionAnswer: true),
    Question(
        questionText: 'Cheetah is the fastest land animal in the world',
        questionAnswer: true),
    Question(
        questionText: 'In Europe, wolf symbolizes good luck',
        questionAnswer: false),
    Question(
        questionText:
            'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        questionAnswer: false),
    Question(
        questionText:
            'The total surface area of two human lungs is approximately 70 square metres.',
        questionAnswer: true),
    Question(
        questionText: 'Google was originally called \"Backrub\".',
        questionAnswer: true),
    Question(
        questionText:
            'The first Indian to recieve NOBLE PRIZE in Literature was Mother Teresa',
        questionAnswer: false),
    Question(
        questionText:
            'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        questionAnswer: true),
    Question(
        questionText:
            'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        questionAnswer: true),
    Question(
        questionText: 'Oktoberfest in Germany is celebrated with whiskey',
        questionAnswer: false),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBanks.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBanks[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBanks[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBanks.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
