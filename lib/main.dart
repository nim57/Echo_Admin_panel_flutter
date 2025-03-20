import 'package:echo_admin_panel_flutter/app.dart';
import 'package:echo_admin_panel_flutter/data/repositories/authentication/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_strategy/url_strategy.dart';

import 'features/home/category/create_categort/cload_cods/category_controller.dart';
import 'features/home/category/create_categort/cload_cods/category_repository.dart'; // New import
import 'features/home/manage_items/add Item/backend/item_controller.dart';
import 'features/home/manage_items/add Item/backend/item_repository.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // Ensure widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Local Storage
  await GetStorage.init();

  // Remove # sign from URL
  setPathUrlStrategy();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize Repositories
  Get.put(AuthenticationRepository());
  Get.put(CategoryRepository());
  Get.put(ItemRepository()); // New repository initialization

  // Initialize controllers
  Get.put(CategoryController());
  Get.put(ItemController()); // New controller initialization

  // Main App Starts here ...
  runApp(const App());
}
