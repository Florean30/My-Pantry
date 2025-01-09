import 'package:get/get.dart';
import '../modules/detailnotif/detailnotif_binding.dart';
import '../modules/detailnotif/detailnotif_page.dart';

class DetailnotifRoutes {
  DetailnotifRoutes._();

  static const detailnotif = '/detailnotif';

  static final routes = [
    GetPage(
      name: detailnotif,
      page: () => const DetailnotifPage(),
      binding: DetailnotifBinding(),
    ),
  ];
}
