import 'package:echo_admin_panel_flutter/Utils/Theme/theme.dart';
import 'package:echo_admin_panel_flutter/bindings/general_bindings.dart';
import 'package:echo_admin_panel_flutter/routes/app_rout.dart';
import 'package:echo_admin_panel_flutter/routes/route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:echo_admin_panel_flutter/utils/constants/text_strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    _setupFirebaseMessaging();
    _subscribeToTopic();
  }

  Future<void> _setupFirebaseMessaging() async {
    await FirebaseMessaging.instance.requestPermission();
    
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle foreground notifications
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleNotificationTap(message.data);
    });
  }

  Future<void> _subscribeToTopic() async {
    await FirebaseMessaging.instance.subscribeToTopic('all_users');
  }

  void _handleNotificationTap(Map<String, dynamic> data) {
    Get.toNamed(ERoutes.createNotification); // Use your notification route name
  }

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
        ),
      ),
    );
  }
}