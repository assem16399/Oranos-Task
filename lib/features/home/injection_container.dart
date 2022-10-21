import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:oranos/features/home/logic/home_cubit.dart';

import '/core/dependency_injection/injection_container.dart'
    as main_di_container;
import '/core/network/network_info.dart';
import '/features/home/data/provider/home_api.dart';
import '/features/home/data/repo/home_repo.dart';

void init() {
  //  TODO Uncomment to use Cubit as State-Management
  main_di_container.sl
      .registerFactory(() => HomeCubit(homeRepo: main_di_container.sl()));

  //ToDo Register Repos
  main_di_container.sl.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(
      homeApi: main_di_container.sl(), networkInfo: main_di_container.sl()));

  //ToDo Register APIS
  main_di_container.sl
      .registerLazySingleton<HomeApi>(() => HomeApiWithDioImpl());

  //ToDo Register Core
  main_di_container.sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(main_di_container.sl()));

  //ToDo Register External Packages
  main_di_container.sl.registerLazySingleton(() => InternetConnectionChecker());
}
