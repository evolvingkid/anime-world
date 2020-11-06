import 'package:get_it/get_it.dart';
import 'animeworldservices.dart';
GetIt locator =GetIt.instance;

void serviceLocators() {
  locator.registerLazySingleton<DioAPIServices>(() => DioAPIServices());
}