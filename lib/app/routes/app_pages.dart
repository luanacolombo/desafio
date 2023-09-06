import 'home_routes.dart';
import 'login_routes.dart';

class AppPages {
  AppPages._();

  static const initial = '/login';

  static final routes = [
    ...HomeRoutes.routes,
    ...LoginRoutes.routes,
  ];
}
