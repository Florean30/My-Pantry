import 'package:get/get.dart';
import '../modules/reset/reset_binding.dart';
import '../modules/reset/reset_page.dart';

class ResetRoutes {
  ResetRoutes._();

  static const reset = '/reset';

  static final routes = [
    GetPage(
      name: reset,
      page: () => const ResetPage(),
      binding: ResetBinding(),
    ),
  ];
}
