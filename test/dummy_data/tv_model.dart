import 'package:ditonton/data/models/tv_model.dart';
import 'package:ditonton/domain/entities/tv.dart';

final tTvModel = TvModel(
  posterPath: 'posterPath',
  popularity: 1.0,
  id: 1,
  backdropPath: 'backdropPath',
  voteAverage: 2.0,
  overview: 'overview',
  firstAirDate: 'firstAirDate',
  originCountry: ['a', 'b'],
  genreIds: [1, 2],
  voteCount: 2,
  name: 'name',
);

final tTv = Tv(
  posterPath: 'posterPath',
  popularity: 1.0,
  id: 1,
  backdropPath: 'backdropPath',
  voteAverage: 2.0,
  overview: 'overview',
  firstAirDate: 'firstAirDate',
  originCountry: ['a', 'b'],
  genreIds: [1, 2],
  voteCount: 2,
  name: 'name',
);
