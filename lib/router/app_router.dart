import 'package:flutter/material.dart';
import 'package:hosptel_app/features/auth/presentation/pages/forget_password_page.dart';
import 'package:hosptel_app/features/auth/presentation/pages/login_page.dart';
import 'package:hosptel_app/features/auth/presentation/pages/signup_page.dart';
import 'package:hosptel_app/features/health/presentation/pages/health_page.dart';
import 'package:hosptel_app/features/home/presentation/pages/home_page.dart';
import 'package:hosptel_app/features/intro/presentation/page/intro_page.dart';
import 'package:hosptel_app/features/notification/presentation/pages/notification_page.dart';
import 'package:hosptel_app/features/profile/presentation/pages/profile_page.dart';
import 'package:hosptel_app/features/reservation/presentation/pages/reservation_page.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      //? Start Intro Page :
      case RouteNamedScreens.introScreenNameRoute:
        return MaterialPageRoute(
          builder: (_) => const IntroPage(),
        ); //? End Intro Page

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

      //? Start Profile Page :
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
        ); //? End Reservation Screen
    }

    return null;
  }
}

class RouteNamedScreens {
  //! Routing Naming
  static const introScreenNameRoute = '/';
  static const loginScreenNameRoute = '/login-screen';
  static const signUpScreenNameRoute = '/signUp-screen';
  static const forgetPasswordScreenNameRoute = '/forget-password-screen';
  static const healthNameRoute = '/health-screen';
  static const notificationNameRoute = '/notification-screen';
  static const homeScreenNameRoute = '/home-screen';
  static const reservationNameRoute = '/reservation-screen';
  static const profileNameRoute = '/profile-screen';

  //!
}
