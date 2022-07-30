import 'package:app_template/core/data_layer/data_layer.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'domain_layer/repositories/repositories.dart';
import 'interfaces/interfaces.dart';

GetIt locator = GetIt.instance;

Future<void> setUpLocator() async {
  //local cache
  // final sharedPrefs = await SharedPreferences.getInstance();
  // locator.registerLazySingleton(() => sharedPrefs);
  // locator.registerLazySingleton<LocalCache>(
  //   () => LocalCacheImpl(
  //     sharedPreferences: sharedPrefs,
  //   ),
  // );
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton(sharedPreferences);

  locator.registerLazySingleton<LocalCache>(
    () => LocalCacheImpl(
      sharedPreferences: sharedPreferences,
    ),
  );

  //* Registering Auth
  locator.registerLazySingleton<AuthService>(() => AuthServiceImpl());
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authService: locator(),
    ),
  );
  //* Register Posts
  locator.registerLazySingleton<PostsService>(() => PostsServiceImpl());
  locator.registerLazySingleton<PostsRepository>(
    () => PostRepositoryImpl(
      postsService: locator(),
    ),
  );
}
