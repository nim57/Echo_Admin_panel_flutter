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
  static const mapPicker = '/mapPicker';

  /// Manage Post
  static const managePost = '/managePost';

  /// Manage Notification
  static const manageNotification = '/Notification';
  static const createNotification = '/createNotification';

  static List sidebarMenuItems = [
    dashboard,
    user_manage,
    category,
    manageItems,
    managePost,
    manageNotification,
  ];
}
