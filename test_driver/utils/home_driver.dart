import 'package:commons/test_driver_utils/test_driver_keys.dart';
import 'package:flutter_driver/flutter_driver.dart';

final class HomeDriver {
  HomeDriver._();

  final _initialLoadingFinder = find.byValueKey(
    TestDriverKeys.initialLoading.key,
  );

  static FlutterDriver? _driver;
  static int _timeOut = 0;

  factory HomeDriver.init(FlutterDriver? driver, [int timeOut = 10]) {
    _driver = driver;
    _timeOut = timeOut;
    return HomeDriver._();
  }

    Future<void> waitForAbsentInitialLoading() async {
    return await _driver?.waitForAbsent(
      _initialLoadingFinder,
      timeout: Duration(seconds: _timeOut),
    );
  }
}
