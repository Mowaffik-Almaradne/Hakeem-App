import 'package:flutter/material.dart';
import 'package:hosptel_app/features/auth/health/presentation/pages/medical_description_page.dart';
import 'package:hosptel_app/features/auth/health/presentation/pages/mony_account.dart';
import 'package:hosptel_app/features/auth/health/presentation/pages/my_file_page.dart';
import 'package:hosptel_app/features/auth/health/presentation/pages/my_visited_page.dart';
import 'package:hosptel_app/features/auth/presentation/pages/forget_password_page.dart';
import 'package:hosptel_app/features/auth/presentation/pages/login_page.dart';
import 'package:hosptel_app/features/auth/presentation/pages/recive_number_page.dart';
import 'package:hosptel_app/features/auth/presentation/pages/signup_page.dart';
import 'package:hosptel_app/features/auth/health/presentation/pages/health_page.dart';
import 'package:hosptel_app/features/home/presentation/pages/home_page.dart';
import 'package:hosptel_app/features/intro/presentation/page/intro_page.dart';
import 'package:hosptel_app/features/notification/presentation/pages/notification_page.dart';
import 'package:hosptel_app/features/profile/presentation/pages/change_password_page.dart';
import 'package:hosptel_app/features/profile/presentation/pages/edit_number_page.dart';
import 'package:hosptel_app/features/profile/presentation/pages/info_profile_page.dart';
import 'package:hosptel_app/features/profile/presentation/pages/main_profile_page.dart';
import 'package:hosptel_app/features/profile/presentation/pages/verification_edit_number.dart';
import 'package:hosptel_app/features/reservation/presentation/pages/reservation_page.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
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
            return const LoginScreen();
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
            return const SignUpPage();
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
      //? Start Forget Password Screen:
      case RouteNamedScreens.forgetPasswordScreenNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const ForgetPasswordPage();
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

      //? Start Forget Password Screen:
      case RouteNamedScreens.reciveNumberVerificationPageScreenNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const ReciveNumberVerificationPage();
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

      //! End Feature Auth //! :
      //? Start Home Screen:
      case RouteNamedScreens.homeScreenNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const HomePage();
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
            return const MyVistsPage();
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
            return const MyFilePage();
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
            return const MidicalDesciptionPage();
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
      //? Start Mony Account Page :
      case RouteNamedScreens.monyAccountNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const MonyAccountPage();
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
            return const NotificationPage();
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
      //? Start Reservation Page :
      case RouteNamedScreens.reservationNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const ReservationPage();
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

      //? Start  Profile Page :
      case RouteNamedScreens.profileNameRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const ProfilePage();
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
            return const InfoProfilePage();
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
            return const ChangePasswordPage();
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
            return const EditNumberPage();
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
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const VerficationEditNumber();
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
  static const forgetPasswordScreenNameRoute = '/forget-password-screen';
  static const reciveNumberVerificationPageScreenNameRoute =
      '/verification-number-screen';
  //? End Auth Feature :
  static const homeScreenNameRoute = '/home-screen';
  //? Start Health Feature :
  static const healthNameRoute = '/health-screen';
  static const myVisitNameRoute = '/myVisit-screen';
  static const myFileNameRoute = '/myFile-screen';
  static const midicalDesciptionNameRoute = '/medical-description-screen';
  static const monyAccountNameRoute = '/mony-account-screen';
  //? End Health Feature :
  static const notificationNameRoute = '/notification-screen';

  static const reservationNameRoute = '/reservation-screen';

  //? Start Profile Feature :
  static const profileNameRoute = '/profile-screen';
  static const infoProfileNameRoute = '/info-profile-screen';
  static const changePasswordNameRoute = '/change-password-screen';
  static const editNumberNameRoute = '/edit-number-screen';
  static const verificationEditNumberNameRoute = '/verification-edit-screen';
  //? End Profile Feature :
  //!
}
