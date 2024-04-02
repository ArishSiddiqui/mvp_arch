import 'package:get_it/get_it.dart';
import 'package:mvp_arch/feature/home/data/home_data_source.dart';
import 'package:mvp_arch/feature/home/data/home_repository_impl.dart';
import 'package:mvp_arch/feature/home/presentor/home_repository.dart';

import 'feature/auth/signUp/presentor/sign_up_riverpod.dart';
import 'feature/auth/login/presentor/login_riverpod.dart';
import 'feature/home/presentor/home_riverpod.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // State Management
  /// Always use registerFactory for any state management registration.
  sl.registerFactory(
    () => LoginStateNotifier(),
  );

  sl.registerFactory(
    () => SignUpStateNotifier(),
  );

  sl.registerFactory(
    () => HomeStateNotifier(
      repository: sl(),
    ),
  );

  // Repository
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      dataSource: sl(),
    ),
  );

  // Data Source
  sl.registerLazySingleton<HomeDataSource>(
    () => HomeDataSourceImpl(),
  );
}
