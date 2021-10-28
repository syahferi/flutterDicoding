import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/usecases/get_tv_airing_today.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  late GetTvAiringToday useCase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    useCase = GetTvAiringToday(mockTvRepository);
  });

  final tTvList = <Tv>[];

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
