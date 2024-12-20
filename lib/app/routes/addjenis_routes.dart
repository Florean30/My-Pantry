import 'package:get/get.dart';

import '../modules/addjenis/addjenis_binding.dart';
import '../modules/addjenis/addjenis_page.dart';

class AddjenisRoutes {
  AddjenisRoutes._();

  static const addjenis = '/addjenis';

  static final routes = [
    GetPage(
      name: addjenis,
      page: () => const AddjenisPage(),
      binding: AddjenisBinding(),
    ),
  ];
}
