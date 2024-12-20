import 'package:get/get.dart';

import 'addjenis_controller.dart';

class AddjenisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddjenisController>(
      () => AddjenisController(),
    );
  }
}
