import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/usecases/get_tv_airing_today.dart';
import 'package:flutter/material.dart';

class TvListNotifier extends ChangeNotifier {
  var _tvAiringToday = <Tv>[];

  List<Tv> get tvAiringToday => _tvAiringToday;

  RequestState _tvAiringState = RequestState.Empty;

  RequestState get tvAiringState => _tvAiringState;

  final GetTvAiringToday getTvAiringToday;

  String _message = '';

  String get message => _message;

  TvListNotifier({required this.getTvAiringToday});

  Future<void> fetchTvAiringToday() async {
    _tvAiringState = RequestState.Loading;
    notifyListeners();

    final result = await getTvAiringToday.execute();
    result.fold((failure) {
      _tvAiringState = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (data) {
      _tvAiringState = RequestState.Loaded;
      _tvAiringToday = data;
      notifyListeners();
    });
  }
}
