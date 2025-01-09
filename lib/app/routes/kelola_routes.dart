import 'package:get/get.dart';
import '../modules/kelola/kelola_binding.dart';
import '../modules/kelola/kelola_page.dart';

class KelolaRoutes {
  KelolaRoutes._();

  static const kelola = '/kelola';

  static final routes = [
    GetPage(
      name: kelola,
      page: () => const KelolaPage(),
      binding: KelolaBinding(),
    ),
  ];
}
