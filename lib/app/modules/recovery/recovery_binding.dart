import 'package:get/get.dart';

import 'recovery_controller.dart';

class RecoveryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecoveryController>(
      () => RecoveryController(),
    );
  }
}
