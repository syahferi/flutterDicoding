import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/tv_model.dart';

void main() {
  test('should be a subclass of tv entity', () async {
    final result = tTvModel.toEntity();
    expect(tTv, result);
  });
}
