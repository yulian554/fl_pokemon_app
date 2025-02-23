import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'utils/home_driver.dart';

void main() {

  group('Pokemon App', () {

    late HomeDriver homeDriver;

    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
      homeDriver = HomeDriver.init(driver);
    });

    tearDownAll(() async {
      if (driver == null) return;
      await driver?.close();
    });

    test('Find one pokemon in home', () async {
      await homeDriver.waitForAbsentInitialLoading();

      final text = find.text('bulbasaur');

      final getText = await driver?.getText(text);

      expect(getText, 'bulbasaur');
    });
  });
}