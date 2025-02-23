import 'dart:ui';

import 'package:app_pokemon/config/provider/main_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  late MainProvider sut;

  setUp(() {
    sut = MainProvider();
  });

  group('main provider test', () {
    test('Should to brightness light', () {
      // Arrange
      final brightness = Brightness.light;

      // Act
      sut.changeThemeMode(brightness: brightness);

      // Assert
      final isDarkMode = sut.isDarkMode;
      expect(isDarkMode, false);
    });

    test('Should to brightness dark', () {
      // Arrange
      final brightness = Brightness.dark;

      // Act
      sut.changeThemeMode(brightness: brightness);

      // Assert
      final isDarkMode = sut.isDarkMode;
      expect(isDarkMode, true);
    });
  });
}