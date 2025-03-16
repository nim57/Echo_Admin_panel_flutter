class ERoutes {
  static const login = '/login';
  static const forgetPassword = '/forgetPassword';
  static const resetPAssword = '/resetPassword';
  static const dashboard = '/dashboard';
  static const user_manage = '/user_manage';

  static const category = '/category';
  static const createCategory = '/createCategory';
  static const editCategory = '/editCategory';

  /// manage items
  static const manageItems = '/manageItems';
  static const createItem = '/createItem';
  static const editItem = '/editItem';
  static const pendingItem = '/PeingItems';

  static List sidebarMenuItems = [
    dashboard,
    user_manage,
    category,
    manageItems,
  ];
}
