import 'package:get/get.dart';

import '../modules/activity_history/activity_history_binding.dart';
import '../modules/activity_history/activity_history_page.dart';

class ActivityHistoryRoutes {
  ActivityHistoryRoutes._();

  static const activityHistory = '/activity-history';

  static final routes = [
    GetPage(
      name: activityHistory,
      page: () => const ActivityHistoryPage(),
      binding: ActivityHistoryBinding(),
    ),
  ];
}
