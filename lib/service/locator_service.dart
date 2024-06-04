import 'package:app_pokenmon/service/navigation_service.dart';
import 'package:commons/services/locator_service.dart';

void setupLocator() {
  config();
  locator.registerLazySingleton(() => NavigationService());
}
