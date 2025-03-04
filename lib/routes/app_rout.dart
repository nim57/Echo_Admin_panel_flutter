import 'package:echo_admin_panel_flutter/features/authentication/screens/forget_password/forget_password.dart';
import 'package:echo_admin_panel_flutter/features/authentication/screens/reset_password/reset_password.dart';
import 'package:echo_admin_panel_flutter/routes/route.dart';
import 'package:echo_admin_panel_flutter/routes/route_middilewarer.dart';
import 'package:get/get.dart';

import '../features/authentication/screens/login/login.dart';
import '../features/home/dashboard/dashboard_screen.dart';

class EAppRoute {
  static final List<GetPage> page = [
    GetPage(name: ERoutes.login, page: () => const LoginScreen()),
    GetPage(
        name: ERoutes.forgetPassword, page: () => const ForgetPasswordScreen()),
    GetPage(
        name: ERoutes.resetPAssword, page: () => const ResetPasswordScreen()),
    GetPage(
        name: ERoutes.dashboard,
        page: () => const DashboardScreen(),
        middlewares: [ERouteMiddleware()]),
  ];
}
