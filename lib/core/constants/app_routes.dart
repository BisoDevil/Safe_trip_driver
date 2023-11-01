
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:safe_trip_driver_app/modules/home/view/home_view.dart';
import 'package:safe_trip_driver_app/modules/login/bindings/login_binding.dart';
import 'package:safe_trip_driver_app/modules/personal_info/bindings/personal_info_binding.dart';
import 'package:safe_trip_driver_app/modules/profile/bindings/profile_binding.dart';
import 'package:safe_trip_driver_app/modules/personal_info/view/personal_info_view.dart';
import '../../modules/home/bindings/home_binding.dart';
import '../../modules/login/view/login_view.dart';
import '../../modules/profile/view/profile_view.dart';



class Routes {
  static const String loginRoute = '/login_view';
  static const String homeRoute = '/home_view';
  static const String profileRoute = '/profile_view';
  static const String personalInfoRoute = '/personal_info_view';
}

class AppRoutes {
  static final routes = [
    GetPage(
        name: Routes.loginRoute,
        page: () => const LoginView(),
        binding: LoginBinding(),
    ),
    GetPage(
        name: Routes.homeRoute,
        page: () => const HomeView(),
        binding: HomeBinding()
    ),
    GetPage(
        name: Routes.profileRoute,
        page: () => const ProfileView(),
        binding: ProfileBinding()
    ),
    GetPage(
        name: Routes.personalInfoRoute,
        page: () => const PersonalInfoView(),
        binding: PersonalInfoBinding()
    )
  ];
}
