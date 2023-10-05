import 'package:dbook/screen/user/Login/login_screen.dart';
import 'package:dbook/screen/user/signup/signup_screen.dart';
import 'package:flutter/material.dart';

import '../../screen/app_loading/view/app_loading_screen.dart';
import '../../screen/dashboard/view/dashboard_view.dart';
import '../../screen/user/change_passowrd/change_password_screen.dart';
import '../../screen/user/loginorsignup/login_or_signup_view.dart';
import 'route_paths.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute<dynamic>(builder: (BuildContext context) {
        return const AppLoadingView();
      });

    case RoutePaths.home:
      return MaterialPageRoute<dynamic>(
          settings: const RouteSettings(name: RoutePaths.home),
          builder: (BuildContext context) {
            return const DashboardView();
          });

    case RoutePaths.login:
      return MaterialPageRoute<dynamic>(
          settings: const RouteSettings(name: RoutePaths.login),
          builder: (BuildContext context) {
            return const LoginScreen();
          });

    case RoutePaths.signUp:
      return MaterialPageRoute<dynamic>(
          settings: const RouteSettings(name: RoutePaths.signUp),
          builder: (BuildContext context) {
            return const SignUpScreen();
          });

    case RoutePaths.loginOrSignup:
      return MaterialPageRoute<dynamic>(
          settings: const RouteSettings(name: RoutePaths.loginOrSignup),
          builder: (BuildContext context) {
            return const LoginOrSignUpView();
          });

    case RoutePaths.changePassword:
      return MaterialPageRoute<dynamic>(
          settings: const RouteSettings(name: RoutePaths.changePassword),
          builder: (BuildContext context) {
            return const ChangePasswordScreen();
          });

    default:
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              const AppLoadingView());
  }
}
