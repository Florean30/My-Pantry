import 'package:get/get.dart';

import '../modules/activity/activity_binding.dart';
import '../modules/activity/activity_page.dart';

class ActivityRoutes {
  ActivityRoutes._();

  static const activity = '/activity';

  static final routes = [
    GetPage(
      name: activity,
      page: () => const ActivityPage(),
      binding: ActivityBinding(),
    ),
  ];
}
