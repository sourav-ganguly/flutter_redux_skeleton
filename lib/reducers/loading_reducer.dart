import 'package:redux/redux.dart';
import 'package:clean_architecture_demo/actions/actions.dart';

final loadingReducer = combineReducers<bool>([
  TypedReducer<bool, TriviaLoadedAction>(_setLoaded),
  TypedReducer<bool, TriviaNotLoadedAction>(_setLoaded),
  TypedReducer<bool, SearchRandomTriviaAction>(_setLoading),
  TypedReducer<bool, SearchTriviaAction>(_setLoading),
]);

bool _setLoaded(bool state, action) {
  return false;
}

bool _setLoading(bool state, action) {
  return true;
}
