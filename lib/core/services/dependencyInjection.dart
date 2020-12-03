import 'package:animeworld/core/services/inappupdate.dart';
import 'package:animeworld/core/services/urlLauchServies.dart';
import 'package:get_it/get_it.dart';
import 'animeworldservices.dart';

GetIt locator = GetIt.instance;

void serviceLocators() {
  locator.registerLazySingleton<DioAPIServices>(() => DioAPIServices());
  locator.registerLazySingleton<FirebaseNotificationservices>(
      () => FirebaseNotificationservices());
  locator.registerLazySingleton<FileSaverServices>(() => FileSaverServices());
  locator.registerLazySingleton<URLLaunchServices>(() => URLLaunchServices());
  locator
      .registerLazySingleton<InAppupdateServices>(() => InAppupdateServices());
}
