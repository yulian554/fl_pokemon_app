import 'package:app_pokemon/config/environments/enums/environment.dart';

class EnvironmentConfig {
  final String apiUrl;

  EnvironmentConfig({
    required this.apiUrl,
  });

  static late EnvironmentConfig _instance;
  static EnvironmentConfig get instance => _instance;

  factory EnvironmentConfig.init(Environment env) {
    _instance = switch (env) {
      Environment.dev => EnvironmentConfig(
          apiUrl: 'https://dev-api.example.com',
        ),
      Environment.qa => EnvironmentConfig(
          apiUrl: 'https://qa-api.example.com',
        ),
      Environment.prod => EnvironmentConfig(
          apiUrl: 'https://api.example.com',
        ),
      Environment.instrument => EnvironmentConfig(
          apiUrl: 'https://test-api.example.com',
        ),
    };
    return _instance;
  }
}