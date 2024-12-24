import 'package:get/get.dart';

import '../modules/notif/notif_binding.dart';
import '../modules/notif/notif_page.dart';

class NotifRoutes {
  NotifRoutes._();

  static const notif = '/notif';

  static final routes = [
    GetPage(
      name: notif,
      page: () => const NotifPage(),
      binding: NotifBinding(),
    ),
  ];
}
