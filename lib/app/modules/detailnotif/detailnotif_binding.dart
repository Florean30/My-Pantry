import 'package:get/get.dart';
import 'detailnotif_controller.dart';

class DetailnotifBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailnotifController>(
      () => DetailnotifController(),
    );
  }
}
