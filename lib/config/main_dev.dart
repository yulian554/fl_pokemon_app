import 'package:app_pokemon/config/environments/enums/environment.dart';
import 'package:app_pokemon/config/environments/environment_config.dart';
import 'package:app_pokemon/config/run_main.dart';

void main() async {
  EnvironmentConfig.init(Environment.dev);
  runMain();
}


 