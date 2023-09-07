import 'package:get/get.dart';

import '../modules/recovery/recovery_binding.dart';
import '../modules/recovery/recovery_page.dart';

class RecoveryRoutes {
  RecoveryRoutes._();

  static const recovery = '/recovery';

  static final routes = [
    GetPage(
      name: recovery,
      page: () => const RecoveryPage(),
      binding: RecoveryBinding(),
    ),
  ];
}
