import 'package:echo_admin_panel_flutter/data/repositories/authentication/authentication_repository.dart';
import 'package:echo_admin_panel_flutter/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ERouteMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return AuthenticationRepository.instance.isAuthenticated
        ? null
        : const RouteSettings(name: ERoutes.login);
  }
}
