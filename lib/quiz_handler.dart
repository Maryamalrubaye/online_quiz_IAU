import 'questions.dart';

class QuizHandler {
  int _questionCounter = 0;
  List<Question> _questionsWithAnswers = [
    Question(
        question: 'The most significant principle in subtyping is that an '
            'item of a sub-type class can be placed anyplace a super-type object'
            ' can appear.',
        answer: true),
    Question(
        question: 'In pattern learning, weights are updated more frequently'
            ' than in batch learning.',
        answer: true),
    Question(
        question: 'Binary perceptrons necessitate binary input values.',
        answer: false),
    Question(
        question:
            'To solve the XOR problem, a multilayer perceptron must have at'
            ' least one nonlinear hidden layer.',
        answer: true),
    Question(
        question: 'A single interface can be implemented by several'
            ' distinct classes.',
        answer: true),
    Question(
        question: 'Binary perceptrons require that the input values are binary',
        answer: false),
    Question(
        question: 'Every Java class I write is essentially a subclass.',
        answer: true),
    Question(
        question:
            'The Java compiler will produce a warning message if you override'
            ' a method without using the @Override compiler annotation.',
        answer: false),
    Question(
        question: 'Because the dynamic type of "this" is the child class,'
            ' not the parent class, when I call this.super.toString(),'
            ' I will call the toString() method in the child class.',
        answer: false),
    Question(
        question: 'Users of an interface can define a reference variable with '
            'that interface name and then execute all of the interface methods'
            ' from that reference variable after instantiation.',
        answer: true),
    Question(
        question:
            'Abstract art, like abstract methods, conveys a general notion'
            ' of the item being portrayed but does not go into specifics.',
        answer: true),
    Question(
        question: 'A child class inherits its parents static methods and may '
            'override them. When you use Child.staticMethod(), if the child '
            'class lacks a static method named "staticMethod," and Child'
            ' extends Parent, Java will call Parent.staticMethod() for you.',
        answer: false),
  ];

  void checkForNextQuestion() {
    if (_questionCounter <= _questionsWithAnswers.length - 1) {
      _questionCounter++;
    }
  }

  bool getAnswer() {
    return _questionsWithAnswers[_questionCounter].questionAnswer;
  }

  String getQuestion() {
    return _questionsWithAnswers[_questionCounter].questionText;
  }

  bool quizIsFinished() {
    if (_questionCounter >= _questionsWithAnswers.length - 1) {
      return true;
    }
    return false;
  }

  void clearQuestionCounter() {
    _questionCounter = 0;
  }
}
