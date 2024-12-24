import 'package:get/get.dart';
import 'kelola_controller.dart';

class KelolaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KelolaController>(
      () => KelolaController(),
    );
  }
}
