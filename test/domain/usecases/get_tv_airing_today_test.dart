import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  late GetTvAiringToday useCase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    useCase = GetTvAiringToday(mockTvRepository);
  });

  final tTvList = <TV>[];

  test('should get tv airing today list from the repository', () async {
    //arrange
    when(mockTvRepository.getTvAiringToday())
        .thenAnswer((_) async => Right(tTvList));

    //act
    final result = await useCase.execute();

    //assert
    expect(result, Right(tTvList));
  });
}
