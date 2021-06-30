import 'package:dartz/dartz.dart';
import 'package:clean_architecture_demo/core/error/failures.dart';
import 'package:clean_architecture_demo/models/number_trivia.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}
