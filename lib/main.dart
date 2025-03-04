import 'package:echo_admin_panel_flutter/app.dart';
import 'package:echo_admin_panel_flutter/data/repositories/authentication/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_strategy/url_strategy.dart';

import 'firebase_options.dart';

Future<void> main() async {
  // Ensure that widge are intialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Getx Local Starage
   await GetStorage.init();
  // Remove # sign from url
  setPathUrlStrategy();

  // Initialize Firebase & Authentication Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((_) => Get.put(AuthenticationRepository()));

  // Main App Starts here ...

  runApp(const App());
}
