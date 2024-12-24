import 'package:get/get.dart';
import 'listkategori_controller.dart';

class ListkategoriBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListkategoriController>(
      () => ListkategoriController(),
    );
  }
}
