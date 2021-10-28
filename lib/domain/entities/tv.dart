import 'package:equatable/equatable.dart';

class Tv extends Equatable {
  Tv(
      {required this.posterPath,
      required this.popularity,
      required this.id,
      required this.backdropPath,
      required this.voteAverage,
      required this.overview,
      required this.firstAirDate,
      required this.originCountry,
      required this.genreIds,
      required this.voteCount,
      required this.name});

  String? posterPath;
  double? popularity;
  int id;
  String? backdropPath;
  double? voteAverage;
  String? overview;
  String? firstAirDate;
  List<String>? originCountry;
  List<int>? genreIds;
  int? voteCount;
  String? name;

  @override
  List<Object?> get props => [
        posterPath,
        popularity,
        id,
        backdropPath,
        voteAverage,
        overview,
        firstAirDate,
        originCountry,
        genreIds,
        voteCount,
        name,
      ];
}
