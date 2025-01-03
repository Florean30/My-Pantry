import 'package:get/get.dart';
import 'intro_routes.dart'; 
import 'login_routes.dart'; 
import 'register_routes.dart';
import 'forgot_routes.dart'; 
import 'verification_routes.dart'; 
import 'reset_routes.dart'; 
import 'profile_routes.dart'; 
import 'editprofile_routes.dart'; 
import 'home_routes.dart';  
import 'addkategori_routes.dart';
import 'listkategori_routes.dart'; 
import 'kelola_routes.dart'; 
import 'activity_routes.dart'; 
import 'notif_routes.dart';
import 'detailnotif_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = '/intro';

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
    ...AddkategoriRoutes.routes,
    ...ListkategoriRoutes.routes,
    ...KelolaRoutes.routes,
    ...ActivityRoutes.routes,
		...NotifRoutes.routes,
		...DetailnotifRoutes.routes,
  ];
}
