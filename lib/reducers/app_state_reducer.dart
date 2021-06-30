import 'package:clean_architecture_demo/models/models.dart';
import 'package:clean_architecture_demo/reducers/loading_reducer.dart';
import 'package:clean_architecture_demo/reducers/trivia_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    isLoading: loadingReducer(state.isLoading, action),
    trivia: triviaReducer(state.trivia, action),
  );
}
