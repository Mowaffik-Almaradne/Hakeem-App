import 'package:get_it/get_it.dart';
import 'package:hosptel_app/core/network/network_info.dart';
import 'package:hosptel_app/features/advertisement/data/datasources/remote/advertisement_remote.dart';
import 'package:hosptel_app/features/advertisement/data/repositories/advertisement_repositories_impl.dart';
import 'package:hosptel_app/features/advertisement/domain/repositories/advertisement_repositories.dart';
import 'package:hosptel_app/features/advertisement/domain/usecases/advertisement_base_case.dart';
import 'package:hosptel_app/features/advertisement/domain/usecases/use_case_advertisement.dart';
import 'package:hosptel_app/features/advertisement/presentation/cubit/advertisement_cubit.dart';
import 'package:hosptel_app/features/auth/data/datasources/remote/auth_remote.dart';
import 'package:hosptel_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:hosptel_app/features/auth/domin/repository/auth_repository.dart';
import 'package:hosptel_app/features/auth/domin/usecases/auth_base_usecase.dart';
import 'package:hosptel_app/features/auth/domin/usecases/auth_usecase.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/confirm_account/confirm_account_cubit.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/confirm_forget_password_cubit/confirm_forget_password_cubit.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/create_Account_cubit/create_account_cubit.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/forget_password_phone_cubit/forget_password_phone_cubit.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/resend_code_cubit/resend_code_cubit.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/reset_password_cubit.dart/reset_password_cubit.dart';
import 'package:hosptel_app/features/doctor/data/datasources/remote/about_doctor_remote.dart';
import 'package:hosptel_app/features/doctor/data/repositories/about_doctor_repositorie_impl.dart';
import 'package:hosptel_app/features/doctor/domain/repositories/about_doctor_repositories.dart';
import 'package:hosptel_app/features/doctor/domain/usecases/about_doctor_base_case.dart';
import 'package:hosptel_app/features/doctor/domain/usecases/about_doctor_use_case.dart';
import 'package:hosptel_app/features/doctor/presentation/cubit/about_doctor_cubit/doctor_cubit.dart';
import 'package:hosptel_app/features/doctor/presentation/cubit/get_all_work_hours_cubit/get_all_work_hours_for_doctor_cubit.dart';
import 'package:hosptel_app/features/health/data/datasources/remote/health_remote.dart';
import 'package:hosptel_app/features/health/data/repositories/health_repositories_impl.dart';
import 'package:hosptel_app/features/health/domain/repositories/health_repositores.dart';
import 'package:hosptel_app/features/health/domain/usecases/health_base_use.dart';
import 'package:hosptel_app/features/health/domain/usecases/health_use_case.dart';
import 'package:hosptel_app/features/health/presentation/cubit/get_all_accounts_for_patient_cubit/get_all_accounts_for_patient_cubit.dart';
import 'package:hosptel_app/features/health/presentation/cubit/get_all_medical_session_cubit/get_all_medical_session_cubit.dart';
import 'package:hosptel_app/features/health/presentation/cubit/get_all_patient_attachmnet_cubit/get_all_patient_attachmnet_cubit.dart';
import 'package:hosptel_app/features/health/presentation/cubit/get_all_prescription_cubit.dart/get_all_prescription_cubit.dart';
import 'package:hosptel_app/features/health/presentation/cubit/get_all_prescription_details_cubit/get_all_prescription_details_cubit.dart';
import 'package:hosptel_app/features/notification/data/datasources/remote/notification_remote.dart';
import 'package:hosptel_app/features/notification/data/repositories/notification_repositories_impl.dart';
import 'package:hosptel_app/features/notification/domain/repositories/notification_repositories.dart';
import 'package:hosptel_app/features/notification/domain/usecases/notification_base_use_case.dart';
import 'package:hosptel_app/features/notification/domain/usecases/notification_use_case.dart';
import 'package:hosptel_app/features/notification/presentation/cubit/get_all_patiient_notification_cubit/get_all_patient_notification_cubit.dart';
import 'package:hosptel_app/features/notification/presentation/cubit/set_notifications_as_readed_cubit/set_notifications_as_readed_cubit.dart';
import 'package:hosptel_app/features/profile/data/datasources/remote/profile_remote.dart';
import 'package:hosptel_app/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:hosptel_app/features/profile/domain/repositories/profile_repository.dart';
import 'package:hosptel_app/features/profile/domain/usecases/base_use_profile.dart';
import 'package:hosptel_app/features/profile/domain/usecases/use_case_profile.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/change_password_cubit/change_password_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/confirm_edit_phone_number_cubit/confirm_edit_phone_number_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/delete_account_cubit/delete_account_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/get_Patient_Profile_cubit/get_patient_profile_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/logout_cubit/logout_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/send_confirmation_code_for_edit_number_cubit/send_confirmation_code_for_edit_number_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/updata_patient_profile_cubit/updata_patient_profile_cubit.dart';
import 'package:hosptel_app/features/reservation/data/datasources/remote/reservation_remote.dart';
import 'package:hosptel_app/features/reservation/data/repositories/reservation_repository_impl.dart';
import 'package:hosptel_app/features/reservation/domain/repositories/reservation_repository.dart';
import 'package:hosptel_app/features/reservation/domain/usecases/reservation_use_cas.dart';
import 'package:hosptel_app/features/reservation/domain/usecases/resrvation_base_use.dart';
import 'package:hosptel_app/features/reservation/presentation/cubit/create_apponiment_cubit/create_appoinment_cubit.dart';
import 'package:hosptel_app/features/reservation/presentation/cubit/get_all_avaliable_days_cubit/get_all_available_days_cubit.dart';
import 'package:hosptel_app/features/reservation/presentation/cubit/get_all_avaliable_time_cubit/get_all_available_time_cubit.dart';
import 'package:hosptel_app/features/reservation/presentation/cubit/get_all_my_reservation_cubit/get_all_my_reservation_cubit.dart';
import 'package:hosptel_app/features/services/data/datasources/remote/services_remote.dart';
import 'package:hosptel_app/features/services/data/repositories/services_repositories_impl.dart';
import 'package:hosptel_app/features/services/domain/repositories/services_repositories.dart';
import 'package:hosptel_app/features/services/domain/usecases/services_base_case.dart';
import 'package:hosptel_app/features/services/domain/usecases/services_use_case.dart';
import 'package:hosptel_app/features/services/presentation/cubit/services_cubit.dart';
import 'package:hosptel_app/features/symptom/data/datasources/remote/symptom_remote.dart';
import 'package:hosptel_app/features/symptom/data/repositories/symptom_repositories_impl.dart';
import 'package:hosptel_app/features/symptom/domain/repositories/symptom_repositories.dart';
import 'package:hosptel_app/features/symptom/domain/usecases/bas_use_symptom.dart';
import 'package:hosptel_app/features/symptom/domain/usecases/use_case_symptom.dart';
import 'package:hosptel_app/features/symptom/presentation/cubit/diagnosis_cubit.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;
Future<void> init() async {
//! Features - Auth :
//? Cubit
  sl.registerFactory(() => CreateAccountCubit(useCase: sl()));
  sl.registerFactory(() => LoginCubit(useCase: sl()));
  sl.registerFactory(() => ConfirmAccountCubit(useCase: sl()));
  sl.registerFactory(() => ResendCodeCubit(useCase: sl()));
  sl.registerFactory(() => ForgetPassswordPhoneCubit(useCase: sl()));
  sl.registerFactory(() => ConfirmForgetPasswordCubit(useCase: sl()));
  sl.registerFactory(() => ResetPasswordCubit(useCase: sl()));
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
//! Features - Profil Start :
  sl.registerFactory(() => ChangePasswordCubit(useCase: sl()));
  sl.registerFactory(() => ConfirmEditPhoneNumberCubit(useCase: sl()));
  sl.registerFactory(() => LogoutCubit(useCase: sl()));
  sl.registerFactory(() => DeleteAccountCubit(useCase: sl()));
  sl.registerFactory(() => UpdataPatientProfileCubit(useCase: sl()));
  sl.registerFactory(() => GetPatientProfileCubit(useCase: sl()));
  sl.registerFactory(
      () => SendConfirmationCodeForEditNumberCubit(useCase: sl()));

//?
//? Usecase
  sl.registerLazySingleton<ProfileBaseUseCase>(
    () => ProfileUseCaseImpl(
      repository: sl(),
    ),
  );
//?
//? Repo
  sl.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(
        remote: sl(),
      ));
// DataSources
  //? Remote
  sl.registerLazySingleton<ProfileRemote>(() => ProfileRemoteImpl());
  //! Features - Profil Finished
  //! Features - About Start :
  //? Cubit :
  sl.registerFactory(() => GetAboutDoctorCubit(useCase: sl()));
  sl.registerFactory(() => GetAllWorkHoursForDoctorCubit(useCase: sl()));
//?
//? Usecase
  sl.registerLazySingleton<AboutDoctorBaseUseCase>(
    () => AboutDoctorUseCaseImpl(repositories: sl()),
  );
//?
//? Repo
  sl.registerLazySingleton<AboutDoctorRepositories>(
      () => AboutDoctorRepositoriesImpl(
            remote: sl(),
          ));
// DataSources
  //? Remote
  sl.registerLazySingleton<AboutDoctorRemote>(() => AboutDoctorRemoteImpl());
  //! Features - About End :
  //! Features - Services Start:
  //? Cubit :
  sl.registerFactory(() => GetAllServicesCubit(usecase: sl()));
//?
//? Usecase
  sl.registerLazySingleton<ServicesBaseCase>(
    () => ServicesUseCaseImpl(repositories: sl()),
  );
//?
//? Repo
  sl.registerLazySingleton<ServicesRepositories>(() => ServicesRepositoriesImpl(
        remote: sl(),
      ));
// DataSources
  //? Remote
  sl.registerLazySingleton<ServicesRemote>(() => ServicesRemoteImpl());
  //! Features - Services End:

  //! Features - Advertisement Start:
  //? Cubit :
  sl.registerFactory(() => GetAllAdvertisementCubit(usecase: sl()));
//?
//? Usecase
  sl.registerLazySingleton<AdvertisementBaseCase>(
    () => AdvertisementUseCaseImpl(repositories: sl()),
  );
//?
//? Repo
  sl.registerLazySingleton<AdvertisementRepositories>(
      () => AdvertisementRepositoriesImpl(
            remote: sl(),
          ));
// DataSources
  //? Remote
  sl.registerLazySingleton<AdvertisementRemote>(
      () => AdvertisementRemoteImpl());
  //! Features - Advertisement End:

  //! Features - Reservation Start:
  sl.registerFactory(() => GetAllAvaliableDaysCubit(useCase: sl()));
  sl.registerFactory(() => GetAllAvaliableTimeCubit(useCase: sl()));
  sl.registerFactory(() => CreateAppoinmentCubit(useCase: sl()));
  sl.registerFactory(() => GetAllMyReservationCubit(usecase: sl()));
//?
//? Usecase
  sl.registerLazySingleton<ReservationBaseUseCase>(
    () => ReservationUseCaseImpl(repository: sl()),
  );
//?
//? Repo
  sl.registerLazySingleton<ReservationRepository>(
      () => ReservationRepositoryImpl(
            remote: sl(),
          ));
// DataSources
  //? Remote
  sl.registerLazySingleton<ReservationRemote>(() => ReservationRemoteImpl());
  //! Features - Reservation End:

//! Features - Symptom Start:
  sl.registerFactory(() => GetAllSymptomCubit(usecase: sl()));
//?
//? Usecase
  sl.registerLazySingleton<SymptomBaseUseCase>(
    () => SymptomUseCaseImpl(repositories: sl()),
  );
//?
//? Repo
  sl.registerLazySingleton<SymptomRepositories>(() => SymptomRepositoriesImpl(
        remote: sl(),
      ));
// DataSources
  //? Remote
  sl.registerLazySingleton<SymptomRemote>(() => SymptomRemoteImpl());
  //! Features - Symptom End:

  //! Features - Health Start:
  //? Cubit :
  sl.registerFactory(() => GetAllMedicalSessionCubit(usecase: sl()));
  sl.registerFactory(() => GetAllPatientAttachmnetCubit(usecase: sl()));
  sl.registerFactory(() => GetAllPrescriptionCubit(usecase: sl()));
  sl.registerFactory(() => GetAllPrescriptionDetailsCubit(usecase: sl()));
  sl.registerFactory(() => GetAllAccountsForPatientCubit(usecase: sl()));
//?

//? Usecase
  sl.registerLazySingleton<HealthBaseUse>(
    () => HealthUseCase(repositores: sl()),
  );
//?
//? Repo
  sl.registerLazySingleton<HealthRepositores>(() => HealthRepositoriesImpl(
        remote: sl(),
      ));
// DataSources
  //? Remote
  sl.registerLazySingleton<HealthRemote>(() => HealthRemoteImpl());
  //! Features - Health End:

  //! Features - Notification Start :
  //? Cubit :
  sl.registerFactory(() => GetAllPatientNotificationCubit(usecase: sl()));
  sl.registerFactory(() => SetNotificationsAsReadedCubit(usecase: sl()));
//?

//? Usecase
  sl.registerLazySingleton<NotificationBaseUseCase>(
    () => NotificationUseCaseImpl(repository: sl()),
  );
//?
//? Repo
  sl.registerLazySingleton<NotificationRepositories>(
      () => NotificationRepositoriesImpl(
            remote: sl(),
          ));
// DataSources
  //? Remote
  sl.registerLazySingleton<NotificationRemote>(() => NotificationRemoteImpl());
  //! Features - Notification End :

//! Features - Global
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImplemntes(sl()),
  );
  sl.registerLazySingleton(
    () => InternetConnectionChecker(),
  );
//! Features - Global Finished
}
