import 'package:clean_architecture_demo/actions/actions.dart';
import 'package:clean_architecture_demo/models/models.dart';
import 'package:clean_architecture_demo/core/data/repositories/number_trivia_repository.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createNetworkTriviaMiddleware(
  NumberTriviaRepository repository,
) {
  final loadRandomTrivia = _createLoadRandomTrivia(repository);
  final loadTrivia = _createLoadTrivia(repository);
  return [
    TypedMiddleware<AppState, SearchRandomTriviaAction>(loadRandomTrivia),
    TypedMiddleware<AppState, SearchTriviaAction>(loadTrivia),
  ];
}

Middleware<AppState> _createLoadTrivia(NumberTriviaRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    if (action is SearchTriviaAction) {
      repository.getConcreteNumberTrivia(action.number).then((result) {
        result.fold((failure) => store.dispatch(TriviaNotLoadedAction()),
            (trivia) {
          store.dispatch(TriviaLoadedAction(trivia));
        });
      });
      next(action);
    }
  };
}

Middleware<AppState> _createLoadRandomTrivia(
    NumberTriviaRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.getRandomNumberTrivia().then((result) {
      result.fold((failure) => store.dispatch(TriviaNotLoadedAction()),
          (trivia) {
        store.dispatch(TriviaLoadedAction(trivia));
      });
    });
    next(action);
  };
}
