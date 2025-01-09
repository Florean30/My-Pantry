import 'package:get/get.dart';
import '../modules/intro/intro_binding.dart';
import '../modules/intro/intro_page.dart';

class IntroRoutes {
  IntroRoutes._();

  static const intro = '/intro';

  static final routes = [
    GetPage(
      name: intro,
      page: () => const IntroPage(),
      binding: IntroBinding(),
    ),
  ];
}
