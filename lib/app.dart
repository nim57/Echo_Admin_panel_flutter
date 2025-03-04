import 'package:echo_admin_panel_flutter/Utils/Theme/theme.dart';
import 'package:echo_admin_panel_flutter/bindings/general_bindings.dart';
import 'package:echo_admin_panel_flutter/routes/app_rout.dart';
import 'package:echo_admin_panel_flutter/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils/constants/text_strings.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: ETexts.appneme,
      themeMode: ThemeMode.light,
      theme: EAppTheme.lightTheme,
      darkTheme: EAppTheme.darkTheme,
      getPages: EAppRoute.page,
      initialBinding: GeneralBindings(),
      initialRoute: ERoutes.login,
      unknownRoute: GetPage(
          name: '/page-not_found',
          page: () => const Scaffold(
                body: Center(
                  child: Text('Page Not Found'),
                ),
              )),
    ); // GetMaterialApp
  }
}
