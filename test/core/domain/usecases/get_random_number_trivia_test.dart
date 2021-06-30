// import 'package:clean_architecture_demo/core/usecases/usecase.dart';
// import 'package:clean_architecture_demo/models/number_trivia.dart';
// import 'package:clean_architecture_demo/domain/repositories/number_trivia_repository.dart';
// import 'package:clean_architecture_demo/domain/usecases/get_random_number_trivia.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
//
// class MockNumberTriviaRepository extends Mock
//     implements NumberTriviaRepository {}
//
// void main() {
//   GetRandomNumberTrivia usecase;
//   MockNumberTriviaRepository mockNumberTriviaRepository;
//
//   setUp(() {
//     mockNumberTriviaRepository = MockNumberTriviaRepository();
//     usecase = GetRandomNumberTrivia(mockNumberTriviaRepository);
//   });
//
//   final tNumberTrivia = NumberTrivia(number: 1, text: 'test');
//
//   test(
//     'should get trivia from the repository',
//     () async {
//       // arrange
//       when(mockNumberTriviaRepository.getRandomNumberTrivia())
//           .thenAnswer((_) async => Right(tNumberTrivia));
//       // act
//       final result = await usecase(NoParams());
//       // assert
//       expect(result, Right(tNumberTrivia));
//       verify(mockNumberTriviaRepository.getRandomNumberTrivia());
//       verifyNoMoreInteractions(mockNumberTriviaRepository);
//     },
//   );
// }
