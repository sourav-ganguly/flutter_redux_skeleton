import 'package:clean_architecture_demo/actions/actions.dart';
import 'package:clean_architecture_demo/models/models.dart';
import 'package:redux/redux.dart';

final triviaReducer = combineReducers<NumberTrivia>([
  TypedReducer<NumberTrivia, TriviaLoadedAction>(_loadTrivia),
]);

NumberTrivia _loadTrivia(NumberTrivia trivia, TriviaLoadedAction action) {
  return action.trivia;
}
