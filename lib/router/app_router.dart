import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptel_app/features/advertisement/presentation/cubit/advertisement_cubit.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/confirm_account/confirm_account_cubit.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/confirm_forget_password_cubit/confirm_forget_password_cubit.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/create_Account_cubit/create_account_cubit.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/forget_password_phone_cubit/forget_password_phone_cubit.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/resend_code_cubit/resend_code_cubit.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/reset_password_cubit.dart/reset_password_cubit.dart';
import 'package:hosptel_app/features/auth/presentation/logic/auth_logic.dart';
import 'package:hosptel_app/features/auth/presentation/pages/confirm_forget_password_page.dart';
import 'package:hosptel_app/features/auth/presentation/pages/reset_password_page.dart';
import 'package:hosptel_app/features/doctor/presentation/cubit/about_doctor_cubit/doctor_cubit.dart';
import 'package:hosptel_app/features/doctor/presentation/cubit/get_all_work_hours_cubit/get_all_work_hours_for_doctor_cubit.dart';
import 'package:hosptel_app/features/health/domain/entities/res/prescription_get_all_entities.dart';
import 'package:hosptel_app/features/health/presentation/cubit/get_all_accounts_for_patient_cubit/get_all_accounts_for_patient_cubit.dart';
import 'package:hosptel_app/features/health/presentation/cubit/get_all_medical_session_cubit/get_all_medical_session_cubit.dart';
import 'package:hosptel_app/features/health/presentation/cubit/get_all_patient_attachmnet_cubit/get_all_patient_attachmnet_cubit.dart';
import 'package:hosptel_app/features/health/presentation/cubit/get_all_prescription_cubit.dart/get_all_prescription_cubit.dart';
import 'package:hosptel_app/features/health/presentation/cubit/get_all_prescription_details_cubit/get_all_prescription_details_cubit.dart';
import 'package:hosptel_app/features/health/presentation/pages/medical_description/medical_description_main_page.dart';
import 'package:hosptel_app/features/health/presentation/pages/medical_description/medical_description_table.dart';
import 'package:hosptel_app/features/health/presentation/pages/mony_account.dart';
import 'package:hosptel_app/features/health/presentation/pages/my_file_page.dart';
import 'package:hosptel_app/features/health/presentation/pages/my_visited_page.dart';
import 'package:hosptel_app/features/auth/presentation/pages/forget_password.dart';
import 'package:hosptel_app/features/auth/presentation/pages/login_page.dart';
import 'package:hosptel_app/features/auth/presentation/pages/confrim_number_page.dart';
import 'package:hosptel_app/features/auth/presentation/pages/signup_page.dart';
import 'package:hosptel_app/features/health/presentation/pages/health_page.dart';
import 'package:hosptel_app/features/home/presentation/pages/home_page.dart';
import 'package:hosptel_app/features/home/presentation/pages/home_secoundry.dart';
import 'package:hosptel_app/features/intro/presentation/page/intro_page.dart';
import 'package:hosptel_app/features/map/presentation/pages/postion_doctor_page.dart';
import 'package:hosptel_app/features/notification/presentation/cubit/get_all_patiient_notification_cubit/get_all_patient_notification_cubit.dart';
import 'package:hosptel_app/features/notification/presentation/cubit/set_notifications_as_readed_cubit/set_notifications_as_readed_cubit.dart';
import 'package:hosptel_app/features/notification/presentation/pages/notification_page.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/change_password_cubit/change_password_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/confirm_edit_phone_number_cubit/confirm_edit_phone_number_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/delete_account_cubit/delete_account_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/get_Patient_Profile_cubit/get_patient_profile_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/logout_cubit/logout_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/send_confirmation_code_for_edit_number_cubit/send_confirmation_code_for_edit_number_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/updata_patient_profile_cubit/updata_patient_profile_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/pages/change_password_page.dart';
import 'package:hosptel_app/features/profile/presentation/pages/edit_number_page.dart';
import 'package:hosptel_app/features/profile/presentation/pages/info_profile_page.dart';
import 'package:hosptel_app/features/profile/presentation/pages/main_profile_page.dart';
import 'package:hosptel_app/features/profile/presentation/pages/verification_edit_number.dart';
import 'package:hosptel_app/features/reservation/domain/entities/req/create_appoinment_request.dart';
import 'package:hosptel_app/features/reservation/presentation/cubit/create_apponiment_cubit/create_appoinment_cubit.dart';
import 'package:hosptel_app/features/reservation/presentation/cubit/get_all_avaliable_days_cubit/get_all_available_days_cubit.dart';
import 'package:hosptel_app/features/reservation/presentation/cubit/get_all_avaliable_time_cubit/get_all_available_time_cubit.dart';
import 'package:hosptel_app/features/reservation/presentation/cubit/get_all_my_reservation_cubit/get_all_my_reservation_cubit.dart';
import 'package:hosptel_app/features/reservation/presentation/pages/my_reservation/reservation_page.dart';
import 'package:hosptel_app/features/reservation/presentation/pages/reservation_now/details_reservation_page.dart';
import 'package:hosptel_app/features/reservation/presentation/pages/reservation_now/summary_reservation.dart';
import 'package:hosptel_app/features/services/presentation/cubit/services_cubit.dart';
import 'package:hosptel_app/features/symptom/presentation/cubit/diagnosis_cubit.dart';
import 'package:hosptel_app/injection/injection_container.dart' as di;

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      //! Start Feature Intro //! :
      //? Start Intro Page :
      case RouteNamedScreens.introScreenNameRoute:
        return MaterialPageRoute(
          builder: (_) => const IntroPage(),
        ); //? End Intro Page
      //! End Feature Intro //! :

      //! Start Feature Auth //! :
      //? Start Login Screen:
      case RouteNamedScreens.loginScreenNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => di.sl<ResendCodeCubit>(),
                ),
                BlocProvider(
                  create: (context) => di.sl<LoginCubit>(),
                ),
              ],
              child: const LoginScreen(),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End Login Screen
      //? Start SignUp Screen:
      case RouteNamedScreens.signUpScreenNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return BlocProvider(
              create: (context) => di.sl<CreateAccountCubit>(),
              child: const SignUpPage(),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End SignUp Screen:

      //? Start Forget Password  Screen:
      case RouteNamedScreens.forgetPasswordPhonePage:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return BlocProvider(
              create: (context) => di.sl<ForgetPassswordPhoneCubit>(),
              child: const ForgetPasswordPage(),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End Forget Password Screen:
      //? Start Forget Password Verification Code  Screen:
      case RouteNamedScreens.confirmAForgetPasswordNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            String phoneNumber = arguments as String;
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => di.sl<ConfirmForgetPasswordCubit>(),
                ),
                BlocProvider(
                  create: (context) => di.sl<ResendCodeCubit>(),
                )
              ],
              child: ConfirmFrogetPassword(
                phoneNumber: phoneNumber,
              ),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End Forget Password Screen:

      //? Start Verificatio for Number :
      case RouteNamedScreens.confirmAccountNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            String phoneNumber = arguments as String;
            return MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => di.sl<ConfirmAccountCubit>()),
                BlocProvider(
                  create: (context) => di.sl<ResendCodeCubit>(),
                )
              ],
              child: ConfirmPhoneNumberPage(
                phoneNumber: phoneNumber,
              ),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End Forget Verificatio for Number:
      //? Start Reset Password Page :
      case RouteNamedScreens.resetPasswordNmaeRoute:
        final data = arguments as InfoForgetPassword;
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return BlocProvider(
              create: (context) => di.sl<ResetPasswordCubit>(),
              child: ResetForgetPassword(
                data: data,
              ),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      //? End Reset Password Page :
      //! End Feature Auth //! :
      //? Start Home Screen:
      case RouteNamedScreens.homeScreenNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                    create: (context) =>
                        di.sl<GetAboutDoctorCubit>()..getAboutDoctor()),
                BlocProvider(
                    create: (context) =>
                        di.sl<GetAllServicesCubit>()..getAllServices()),
                BlocProvider(
                    create: (context) => di.sl<GetAllAdvertisementCubit>()
                      ..getAllAdvertisement()),
              ],
              child: const HomePage(),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End Home Screen:
      case RouteNamedScreens.homeSecoundryScreenNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const HomeSecoundryPage();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End Home Screen:
      //! Start Feature HeaLth :
      //? Start Health Screen:
      case RouteNamedScreens.healthNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const HealthPage();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End Health Screen
      //? Start My Visit Page :
      case RouteNamedScreens.myVisitNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return BlocProvider(
              create: (context) =>
                  di.sl<GetAllMedicalSessionCubit>()..getAllMedicalSession(),
              child: const MyVistsPage(),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      //? End My Visit Page :
      //? Start My File Page :
      case RouteNamedScreens.myFileNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return BlocProvider(
              create: (context) => di.sl<GetAllPatientAttachmnetCubit>()
                ..getAllPatientAttachmnet(),
              child: const MyFilePage(),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End My File Page :

      //? Start MidicalDesciption Page :
      case RouteNamedScreens.midicalDesciptionNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return BlocProvider(
              create: (context) =>
                  di.sl<GetAllPrescriptionCubit>()..getAllprescription(),
              child: const MidicalDesciptionPage(),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End MidicalDesciption Page :
      //? Start Midical Desciption Table Page :

      case RouteNamedScreens.midicalDesciptionTableNameRoute:
        final data = arguments as PrescriptionItem;
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return BlocProvider(
              create: (context) => di.sl<GetAllPrescriptionDetailsCubit>()
                ..getAllDetailsprescription(id: data.id),
              child: MedicalDescriptionTablePage(
                item: data,
              ),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End MidicalDesciption Table Page :

      //? Start Mony Account Page :
      case RouteNamedScreens.monyAccountNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return BlocProvider(
              create: (context) => di.sl<GetAllAccountsForPatientCubit>()
                ..getAllAccountsForPatient(),
              child: const MonyAccountPage(),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End Mony Account Page :
      //! End Feature Health
      //? Start Notification Screen:
      case RouteNamedScreens.notificationNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => di.sl<GetAllPatientNotificationCubit>()
                    ..getAllPatientNotification(),
                ),
                BlocProvider(
                  create: (context) => di.sl<SetNotificationsAsReadedCubit>(),
                ),
              ],
              child: const NotificationPage(),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End Notification Screen
      //! Start Feature Reservation :
      //? Start Reservation Page :
      case RouteNamedScreens.reservationNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return BlocProvider(
              create: (context) => di.sl<GetAllMyReservationCubit>()
                ..getAllMyReservation(isEnded: true),
              child: const ReservationPage(),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End Reservation Screen
      //? Start Reservation Details :
      case RouteNamedScreens.reservationDetailsNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                    create: (context) => di.sl<GetAllWorkHoursForDoctorCubit>()
                      ..getAllWorkHoursForDoctor()),
                BlocProvider(
                    create: (context) => di.sl<GetAllAvaliableDaysCubit>()
                      ..getAllAvaliableDays()),
                BlocProvider(
                  create: (context) => di.sl<GetAllAvaliableTimeCubit>(),
                ),
              ],
              child: DetailesReservationPage(
                request: CreateAppoinmentRequest.fromJson({}),
              ),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End Reservation Details Screen
      //? Start Reservation Summary Screen
      case RouteNamedScreens.reservationSummaryNameRoute:
        final data = arguments as CreateAppoinmentRequest;
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                    create: (context) =>
                        di.sl<GetAllSymptomCubit>()..getAllSymptom()),
                BlocProvider(
                    create: (context) => di.sl<CreateAppoinmentCubit>()),
              ],
              child: SummaryReservationPage(
                request: data,
              ),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End Reservation Summary Screen
      //! End Feature Reservation
      //? Start  Profile Page :
      case RouteNamedScreens.profileNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => di.sl<LogoutCubit>()),
                BlocProvider(create: (context) => di.sl<DeleteAccountCubit>())
              ],
              child: const ProfilePage(),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End Profile page
      //? Start Profile Info Page :
      case RouteNamedScreens.infoProfileNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      di.sl<GetPatientProfileCubit>()..getPatientProfile(),
                  child: const ChangePasswordPage(),
                ),
                BlocProvider(
                  create: (context) => di.sl<UpdataPatientProfileCubit>(),
                  child: const ChangePasswordPage(),
                ),
              ],
              child: const InfoProfilePage(),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End Profile Info Screen
      //? Start Change Password Page :
      case RouteNamedScreens.changePasswordNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return BlocProvider(
              create: (context) => di.sl<ChangePasswordCubit>(),
              child: const ChangePasswordPage(),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End Change Password Page :
      //? Start Edit Number Page :
      case RouteNamedScreens.editNumberNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return BlocProvider(
              create: (context) =>
                  di.sl<SendConfirmationCodeForEditNumberCubit>(),
              child: const EditNumberPage(),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End Edit Number Page :

      //? Start Verfication Edit Number Page :
      case RouteNamedScreens.verificationEditNumberNameRoute:
        final phoneNumber = arguments as String;
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => di.sl<ConfirmEditPhoneNumberCubit>(),
                ),
                BlocProvider(
                  create: (context) =>
                      di.sl<SendConfirmationCodeForEditNumberCubit>(),
                ),
              ],
              child: VerficationEditNumber(
                phoneNumber: phoneNumber,
              ),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End Verfication Edit Number Page :
      //? Start Postion Doctor Page :
      case RouteNamedScreens.postionDoctorNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const PostionDoctorPage();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ); //? End  Postion Doctor Page :
    }

    return null;
  }
}

class RouteNamedScreens {
  //! Routing Naming
  static const introScreenNameRoute = '/';

  //? Start Auth Feature :
  static const loginScreenNameRoute = '/login-screen';
  static const signUpScreenNameRoute = '/signUp-screen';
  static const confirmAccountNameRoute = '/verification-number-screen';
  static const forgetPasswordPhonePage = '/forget-password-screen';
  static const confirmAForgetPasswordNameRoute =
      '/forget-password-verification-screen';
  static const resetPasswordNmaeRoute = '/reset-password-screen';
  //? End Auth Feature :

  //? Strart Home Feature :
  static const homeScreenNameRoute = '/home-screen';
  static const homeSecoundryScreenNameRoute = '/home-secoundry-screen';
  //? End Home Feature :
  //? Start Health Feature :
  static const healthNameRoute = '/health-screen';
  static const myVisitNameRoute = '/myVisit-screen';
  static const myFileNameRoute = '/myFile-screen';
  static const midicalDesciptionNameRoute = '/medical-description-screen';
  static const midicalDesciptionTableNameRoute =
      '/medical-description-table-screen';
  static const monyAccountNameRoute = '/mony-account-screen';
  //? End Health Feature :

  //? Statr Notification :
  static const notificationNameRoute = '/notification-screen';
  //? End Notification :
  //? Start Feature Reservation :
  static const reservationNameRoute = '/reservation-screen';
  static const reservationDetailsNameRoute = '/reservation-reservation-screen';
  static const reservationSummaryNameRoute = '/reservation-summary-screen';
  //? End Feature Reservation

  //? Start Profile Feature :
  static const profileNameRoute = '/profile-screen';
  static const infoProfileNameRoute = '/info-profile-screen';
  static const changePasswordNameRoute = '/change-password-screen';
  static const editNumberNameRoute = '/edit-number-screen';
  static const verificationEditNumberNameRoute = '/verification-edit-screen';
  //? End Profile Feature :

  //? Strart Map Feature :
  static const postionDoctorNameRoute = '/postion-docotr-screen';
  //? End Map Feature :
  //!
}
