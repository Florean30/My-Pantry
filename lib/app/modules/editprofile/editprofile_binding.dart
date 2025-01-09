import 'package:get/get.dart';
import 'editprofile_controller.dart';

class EditprofileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(
      () => EditProfileController(),
    );
  }
}
