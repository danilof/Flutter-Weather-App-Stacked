import 'package:flutter_test/flutter_test.dart';
import 'package:weather_stacked/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('CurrentLocationServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
