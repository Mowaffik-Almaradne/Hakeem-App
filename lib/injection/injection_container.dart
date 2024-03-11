// import 'package:get_it/get_it.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:magic_car_client/core/network/network_info.dart';
// import 'package:magic_car_client/features/auth/data/repository/auth_repository_imp.dart';
// import 'package:magic_car_client/features/auth/presentation/bloc/login_cubit/login_cubit.dart';

// import '../features/auth/data/datasources/remote/auth_remote.dart';
// import '../features/auth/domin/repository/auth_repository.dart';
// import '../features/auth/domin/usecases/login_usecase.dart';

// final sl = GetIt.instance;
// Future<void> init() async {
// //! Features - Auth
// // Bloc
//   sl.registerFactory(() => LoginCubit(loginUsecase: sl()));
// //
// // Usecase
//   sl.registerLazySingleton(() => LoginUsecase(repository: sl()));
// //
// // Repo
//   sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImp(
//         networkInformation: sl(),
//         auhtRemote: sl(),
//       ));
// // DataSources
//   // Remote
//   sl.registerLazySingleton<AuhtRemote>(() => AuthRemoteImp());
//   // Local
// //
// //! Features - Auth Finished

// //! Features - Global
//   sl.registerLazySingleton<NetworkInfo>(
//     () => NetworkInfoImplemntes(sl()),
//   );
//   sl.registerLazySingleton(
//     () => InternetConnectionChecker(),
//   );
// //! Features - Global Finished
// }
