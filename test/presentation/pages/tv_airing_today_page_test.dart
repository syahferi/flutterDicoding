import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/presentation/pages/tv_page.dart';
import 'package:ditonton/presentation/provider/tv_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'tv_airing_today_page_test.mocks.dart';

@GenerateMocks([TvListNotifier])
void main() {
  late MockTvListNotifier mockTvListNotifier;

  setUp(() {
    mockTvListNotifier = MockTvListNotifier();
  });

  Widget _makeTestableWidget(Widget body) {
    return ChangeNotifierProvider<TvListNotifier>.value(
      value: mockTvListNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display progress when state is loading',
      (widgetTester) async {
    when(mockTvListNotifier.tvAiringState).thenReturn(RequestState.Loading);

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await widgetTester.pumpWidget(_makeTestableWidget(TvPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display listView when state is loaded',
      (widgetTester) async {
    when(mockTvListNotifier.tvAiringState).thenReturn(RequestState.Loaded);
    when(mockTvListNotifier.tvAiringToday).thenReturn(<Tv>[]);

    final tvListFinder = find.byType(TvList);

    await widgetTester.pumpWidget(_makeTestableWidget(TvPage()));
    expect(tvListFinder, findsOneWidget);
  });

  testWidgets('Page should error when state is error', (widgetTester) async {
    when(mockTvListNotifier.tvAiringState).thenReturn(RequestState.Error);
    when(mockTvListNotifier.message).thenReturn('Error Message');

    final keyFinder = find.byKey(Key('error_message'));

    await widgetTester.pumpWidget(_makeTestableWidget(TvPage()));
    expect(keyFinder, findsOneWidget);
  });
}
