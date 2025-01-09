import 'package:get/get.dart';

import 'activity_history_routes.dart';
import 'add_category_routes.dart';
import 'detailnotif_routes.dart';
import 'editprofile_routes.dart';
import 'forgot_routes.dart';
import 'home_routes.dart';
import 'intro_routes.dart';
import 'kelola_routes.dart';
import 'listkategori_routes.dart';
import 'login_routes.dart';
import 'profile_routes.dart';
import 'register_routes.dart';
import 'reset_routes.dart';
import 'verification_routes.dart';
import 'notification_routes.dart';

class AppPages {
  AppPages._();

  static const initial = '/intro';

  static final routes = <GetPage>[
    ...IntroRoutes.routes,
    ...LoginRoutes.routes,
    ...RegisterRoutes.routes,
    ...ForgotRoutes.routes,
    ...VerificationRoutes.routes,
    ...ResetRoutes.routes,
    ...ProfileRoutes.routes,
    ...EditprofileRoutes.routes,
    ...HomeRoutes.routes,
    ...ListkategoriRoutes.routes,
    ...KelolaRoutes.routes,
    ...DetailnotifRoutes.routes,
    ...AddCategoryRoutes.routes,
    ...ActivityHistoryRoutes.routes,
		...NotificationRoutes.routes,
  ];
}
