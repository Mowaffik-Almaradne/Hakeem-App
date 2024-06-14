import 'package:get_it/get_it.dart';
import 'package:hosptel_app/core/network/network_info.dart';
import 'package:hosptel_app/features/auth/data/datasources/remote/auth_remote.dart';
import 'package:hosptel_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:hosptel_app/features/auth/domin/repository/auth_repository.dart';
import 'package:hosptel_app/features/auth/domin/usecases/auth_base_usecase.dart';
import 'package:hosptel_app/features/auth/domin/usecases/auth_usecase.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/confirm_account/confirm_account_cubit.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/create_Account/create_account_cubit.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;
Future<void> init() async {
//! Features - Auth
//? Cubit
  sl.registerFactory(() => CreateAccountCubit(useCase: sl()));
  // sl.registerFactory(() => LoginCubit(useCase: sl()));
  sl.registerFactory(() => ConfirmAccountCubit(useCase: sl()));
//?
//? Usecase
  sl.registerLazySingleton<AuthBaseUseCase>(
    () => AuthUseCaseImpl(
      repository: sl(),
    ),
  );
//?
//? Repo
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        remote: sl(),
      ));
// DataSources
  //? Remote
  sl.registerLazySingleton<AuthRemote>(() => AuthRemoteImpl());
  //?
//! Features - Auth Finished

//? Features - Global
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImplemntes(sl()),
  );
  sl.registerLazySingleton(
    () => InternetConnectionChecker(),
  );
//! Features - Global Finished
}
