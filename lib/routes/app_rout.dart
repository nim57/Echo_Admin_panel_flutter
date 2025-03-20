import 'package:echo_admin_panel_flutter/features/authentication/screens/forget_password/forget_password.dart';
import 'package:echo_admin_panel_flutter/features/authentication/screens/reset_password/reset_password.dart';
import 'package:echo_admin_panel_flutter/features/home/category/edit_category/Edit_category.dart';
import 'package:echo_admin_panel_flutter/features/home/mamage_post/manage_post.dart';
import 'package:echo_admin_panel_flutter/features/home/manage_items/add%20Item/item_Add.dart';
import 'package:echo_admin_panel_flutter/features/home/manage_items/edit_item/item_Edit.dart';
import 'package:echo_admin_panel_flutter/features/home/manage_items/pending_items/pending_item.dart';
import 'package:echo_admin_panel_flutter/routes/route.dart';
import 'package:echo_admin_panel_flutter/routes/route_middilewarer.dart';
import 'package:get/get.dart';

import '../features/authentication/screens/login/login.dart';
import '../features/home/category/all_category/Category.dart';
import '../features/home/category/create_categort/create_category.dart';
import '../features/home/dashboard/dashboard_screen.dart';
import '../features/home/manage_items/all_mamage_item/Item_manage/mamage_users.dart';
import '../features/home/manage_user/screen_manage_users/mamage_users.dart';

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
    GetPage(
        name: ERoutes.user_manage,
        page: () => const UserMAnageScreen(),
        middlewares: [ERouteMiddleware()]),

    /// Category
    GetPage(
        name: ERoutes.category,
        page: () => const CategoryScreen(),
        middlewares: [ERouteMiddleware()]),
    GetPage(
        name: ERoutes.createCategory,
        page: () => const CreateCategoryScreen(),
        middlewares: [ERouteMiddleware()]),
    GetPage(
        name: ERoutes.editCategory,
        page: () =>  EditCategortScreen(categoryId: Get.arguments as String,),
        middlewares: [ERouteMiddleware()]),

    /// User
    GetPage(
        name: ERoutes.user_manage,
        page: () => const UserMAnageScreen(),
        middlewares: [ERouteMiddleware()]),

    /// Manage Items
    GetPage(
        name: ERoutes.manageItems,
        page: () => const ItemScreen(),
        middlewares: [
          ERouteMiddleware(),
        ]),
    GetPage(
        name: ERoutes.createItem,
        page: () => const ItemAdd(),
        middlewares: [ERouteMiddleware()]),

    GetPage(
        name: ERoutes.editItem,
        page: () => const ItemEdit(),
        middlewares: [ERouteMiddleware()]),

    GetPage(
        name: ERoutes.pendingItem,
        page: () => const PendingItemScreen(),
        middlewares: [ERouteMiddleware()]),

    GetPage(
        name: ERoutes.managePost,
        page: () => const ManagePostScreen(),
        middlewares: [ERouteMiddleware()]),
  ];
}
