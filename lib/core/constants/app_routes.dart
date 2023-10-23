
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:safe_trip_driver_app/modules/home/view/home_view.dart';
import 'package:safe_trip_driver_app/modules/login/bindings/login_binding.dart';
import '../../modules/home/bindings/home_binding.dart';
import '../../modules/login/view/login_view.dart';



class Routes {
  static const String loginRoute = '/login_view';
  static const String homeRoute = '/home_view';
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
  ];
}
