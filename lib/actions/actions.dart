import 'package:clean_architecture_demo/models/number_trivia.dart';

class SearchTriviaAction {
  final int number;
  SearchTriviaAction(this.number);

  @override
  String toString() {
    return 'SearchTriviaAction{number: $number}';
  }
}

class SearchRandomTriviaAction {}

class TriviaNotLoadedAction {}

class TriviaLoadedAction {
  final NumberTrivia trivia;
  TriviaLoadedAction(this.trivia);

  @override
  String toString() {
    return 'TriviaLoadedAction{trivia: $trivia}';
  }
}
