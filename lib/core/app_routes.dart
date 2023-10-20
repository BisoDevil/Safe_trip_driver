
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:safe_trip_driver_app/modules/home/view/home_view.dart';
import 'package:safe_trip_driver_app/modules/otp/view/otp_view.dart';
import '../modules/login/view/login_view.dart';
import '../modules/splash/view/splash_view.dart';

class Routes {
  static const String splashRoute = '/';
  static const String loginRoute = '/login_view';
  static const String otpRoute = '/otp_view';
  static const String homeRoute = '/home_view';

}


class AppRoutes {
  static final routes = [
    GetPage(
        name: Routes.splashRoute,
        page: () => const SplashView(),

    ),
    GetPage(
        name: Routes.loginRoute,
        page: () => const LoginView(),
        transitionDuration: const Duration(milliseconds: 400),
        transition: Transition.downToUp
    ),
    GetPage(
      name: Routes.otpRoute,
      page: () => const OtpView(),
    ),
    GetPage(
        name: Routes.homeRoute,
        page: () => const HomeView(),
    ),
  ];
}
