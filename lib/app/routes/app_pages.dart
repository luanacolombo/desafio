import 'home_routes.dart';
import 'login_routes.dart';
import 'recovery_routes.dart';
import 'register_routes.dart';
import 'profile_routes.dart';

class AppPages {
  AppPages._();

  static const initial = '/login';

  static final routes = [
    ...HomeRoutes.routes,
    ...LoginRoutes.routes,
		...RecoveryRoutes.routes,
		...RegisterRoutes.routes,
		...ProfileRoutes.routes,
  ];
}
