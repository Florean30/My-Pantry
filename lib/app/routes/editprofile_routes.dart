import 'package:get/get.dart';
import '../modules/editprofile/editprofile_binding.dart';
import '../modules/editprofile/editprofile_page.dart';

class EditprofileRoutes {
  EditprofileRoutes._();

  static const editprofile = '/editprofile';

  static final routes = [
    GetPage(
      name: editprofile,
      page: () => const EditProfilePage(),
      binding: EditprofileBinding(),
    ),
  ];
}
