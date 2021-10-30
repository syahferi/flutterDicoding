import 'package:ditonton/data/models/tv_model.dart';
import 'package:ditonton/data/repositories/tv_repository_impl.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/tv_model.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late TvRepositoryImpl tvRepositoryImpl;
  late MockTvRemoteDataSource mockTvRemoteDataSource;

  setUp(() {
    mockTvRemoteDataSource = MockTvRemoteDataSource();
    tvRepositoryImpl =
        TvRepositoryImpl(tvRemoteDataSource: mockTvRemoteDataSource);
  });

  final tTvModelList = <TvModel>[tTvModel];
  final tTvList = <Tv>[tTv];

  group('tv airing today', () {
    test(
        'should return remote data when the call to remote data source is successful',
        () async {
      //arrange
      when(mockTvRemoteDataSource.getTvAiringToday())
          .thenAnswer((_) async => tTvModelList);

      //act
      final result = await tvRepositoryImpl.getTvAiringToday();

      //assert
      verify(mockTvRemoteDataSource.getTvAiringToday());
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTvList);
    });
  });
}
