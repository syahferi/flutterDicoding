import 'dart:convert';

import 'package:ditonton/common/constants.dart';
import 'package:ditonton/data/datasources/tv_remote_data_source.dart';
import 'package:ditonton/data/models/tv_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';
import '../../json_reader.dart';

void main() {
  late TvRemoteDataSourceImpl dataSourceImpl;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSourceImpl = TvRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('get tv airing today', () {
    final tTvList = TvResponse.fromJson(
            json.decode(readJson('dummy_data/tv_airing_today.json')))
        .tvList;

    test('should return list of tv airing today when the response is 200',
        () async {
      //arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/airing_today?$API_KEY')))
          .thenAnswer((_) async =>
              http.Response(readJson('dummy_data/tv_airing_today.json'), 200));

      //act
      final result = await dataSourceImpl.getTvAiringToday();

      //assert
      expect(result, equals(tTvList));
    });
  });
}
