import 'package:get/get.dart';

import 'fetch_data_controller.dart';

class FetchDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FetchDataController>(
      () => FetchDataController(),
    );
  }
}
