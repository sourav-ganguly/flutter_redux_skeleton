import 'number_trivia.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final bool isLoading;
  final NumberTrivia trivia;

  AppState({this.isLoading = false, this.trivia});

  factory AppState.loading() => AppState(isLoading: false);

  AppState copyWith({
    bool isLoading,
    NumberTrivia trivia,
  }) {
    return AppState(
      isLoading: isLoading ?? this.isLoading,
      trivia: trivia ?? this.trivia,
    );
  }

  @override
  int get hashCode => isLoading.hashCode ^ trivia.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          trivia == other.trivia;

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, trivia: $trivia}';
  }
}
