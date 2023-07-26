
import 'package:dog_breed_app_with_clean_architecture/presentation/bloc/dog_list_cubit/dog_list_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/platform/network_info.dart';
import 'data/datasources/dog_local.dart';
import 'data/datasources/dog_remote.dart';
import 'data/repositories/dogs_repository_impl.dart';
import 'domain/repositories/dog_repository.dart';
import 'domain/usecase/get_all_dogs.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => DogListCubit(getAllDogs: sl()),
  );

  sl.registerLazySingleton(
    () => GetAllDogs(sl()),
  );

  sl.registerLazySingleton<DogRepository>(
    () => DogRepositoryImpl(
        dogRemoteDataSources: sl(),
        dogLocalDataSource: sl(),
        networkInfo: sl()),
  );
  sl.registerLazySingleton<DogRemoteDataSources>(
    () => DogRemoteDataSourcesImpl(
      client: http.Client(),
    ),
  );
  sl.registerLazySingleton<DogLocalDataSource>(
    () => DogLocalDataSourceImpl(sharedPreferences: sl()),
  );
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoIml(sl()),
  );
  sl.registerLazySingleton(
    () => http.Client(),
  );
  sl.registerLazySingleton(
    () => InternetConnectionChecker(),
  );
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
