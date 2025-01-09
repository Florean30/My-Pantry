import 'package:get/get.dart';
import '../modules/forgot/forgot_binding.dart';
import '../modules/forgot/forgot_page.dart';

class ForgotRoutes {
  ForgotRoutes._();

  static const forgot = '/forgot';

  static final routes = [
    GetPage(
      name: forgot,
      page: () => const ForgotPage(),
      binding: ForgotBinding(),
    ),
  ];
}
